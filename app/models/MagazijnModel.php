<?php
class MagazijnModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getMagazijns()
    {
        $this->db->query("SELECT m.*, 
                         CASE 
                            WHEN m.AantalAanwezig > 0 THEN 1 
                            ELSE 0 
                         END as HeeftVoorraad,
                         CASE 
                            WHEN EXISTS (SELECT 1 FROM product_allergenen pa WHERE pa.ProductId = m.Id) THEN 1
                            ELSE 0
                         END as HeeftAllergenen
                         FROM magazijn m 
                         ORDER BY m.Barcode ASC");
        return $this->db->resultSet();
    }

    public function getLeveringInfo($productId)
    {
        // Haal leverancier informatie op
        $this->db->query("SELECT l.*
                         FROM leveranciers l
                         JOIN product_leverancier pl ON l.Id = pl.LeverancierId
                         WHERE pl.ProductId = :productId");
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);  // Expliciet type specificeren
        $leverancierInfo = $this->db->single();

        // Haal leveringsgeschiedenis op
        $this->db->query("SELECT pl.*, m.AantalAanwezig
                         FROM product_leveringen pl
                         JOIN magazijn m ON pl.ProductId = m.Id
                         WHERE pl.ProductId = :productId
                         ORDER BY pl.DatumLevering ASC");
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);  // Expliciet type specificeren
        $leveringen = $this->db->resultSet();

        return [
            'leverancier' => $leverancierInfo,
            'leveringen' => $leveringen
        ];
    }

    public function getAllergenenInfo($productId)
    {
        // Haal product details op
        $this->db->query("SELECT ProductId, Barcode FROM magazijn WHERE Id = :productId");
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);
        $product = $this->db->single();

        // Haal allergenen op
        $this->db->query("SELECT a.* 
                         FROM allergenen a
                         JOIN product_allergenen pa ON a.Id = pa.AllergeenId
                         WHERE pa.ProductId = :productId AND a.IsActief = 1
                         ORDER BY a.Naam ASC");
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);
        $allergenen = $this->db->resultSet();

        return [
            'product' => $product,
            'allergenen' => $allergenen
        ];
    }

    public function getProductDetails($productId)
    {
        $this->db->query("SELECT * FROM magazijn WHERE Id = :productId");
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);  // Expliciet type specificeren
        return $this->db->single();
    }

    public function getNextExpectedDelivery($productId)
    {
        $this->db->query("SELECT VerwachteLeveringsDatum 
                         FROM product_leveringen 
                         WHERE ProductId = :productId 
                         AND VerwachteLeveringsDatum > CURRENT_DATE
                         ORDER BY VerwachteLeveringsDatum ASC 
                         LIMIT 1");
        $this->db->bind(':productId', $productId, PDO::PARAM_INT);
        $result = $this->db->single();
        
        return $result ? $result->VerwachteLeveringsDatum : null;
    }
}