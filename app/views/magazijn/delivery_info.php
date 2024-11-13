<?php require_once APPROOT . '/views/includes/header.php'; ?>

<h3>Levering Informatie voor Product ID: <?= $productId; ?></h3>

<!-- Supplier Information -->
<div>
    <p>Leverancier Naam: <?= $data['deliveryInfo'][0]->SupplierName; ?></p>
    <p>Contactpersoon: <?= $data['deliveryInfo'][0]->ContactPerson; ?></p>
    <p>Leveranciernummer: <?= $data['deliveryInfo'][0]->SupplierNumber; ?></p>
    <p>Mobiel: <?= $data['deliveryInfo'][0]->PhoneNumber; ?></p>
</div>

<!-- Delivery Information Table -->
<table class="table">
    <thead>
        <tr>
            <th>Delivery Date</th>
            <th>Quantity Delivered</th>
            <th>Expected Next Delivery Date</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($data['deliveryInfo'] as $delivery): ?>
            <tr>
                <td><?= $delivery->DeliveryDate; ?></td>
                <td><?= $delivery->QuantityDelivered; ?></td>
                <td><?= $delivery->ExpectedNextDeliveryDate; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>
