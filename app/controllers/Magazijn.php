<?php
class Magazijn extends BaseController
{
    private $magazijnModel;

    public function __construct()
    {
        $this->magazijnModel = $this->model('MagazijnModel');
    }

    public function index()
    {
        $magazijns = $this->magazijnModel->getMagazijns();
        
        $data = [
            'title' => 'Overzicht Magazijn Jamin',
            'message' => NULL,
            'messageColor' => NULL,
            'messageVisibility' => 'display: none;',
            'magazijns' => $magazijns
        ];

        $this->view('magazijn/index', $data);
    }


    public function leveringInfo($productId)
    {
        $productInfo = $this->magazijnModel->getProductDetails($productId);
        $leveringInfo = $this->magazijnModel->getLeveringInfo($productId);

        if (!$productInfo || $productInfo->AantalAanwezig <= 0) {
            $nextDelivery = $this->magazijnModel->getNextExpectedDelivery($productId);
            $data = [
                'title' => 'Levering Informatie',
                'message' => "Er is van dit product op dit moment geen voorraad aanwezig, de verwachte eerstvolgende levering is: " . 
                            ($nextDelivery ? date('d-m-Y', strtotime($nextDelivery)) : 'onbekend'),
                'messageColor' => 'warning',
                'messageVisibility' => 'display: block;',
                'redirect' => true,
                'redirectUrl' => URLROOT . '/magazijn/index',
                'redirectTime' => 4000
            ];
        } else {
            $data = [
                'title' => 'Levering Informatie',
                'product' => $productInfo,
                'leverancier' => $leveringInfo['leverancier'],
                'leveringen' => $leveringInfo['leveringen'],
                'messageVisibility' => 'display: none;'
            ];
        }
        $this->view('magazijn/leveringinfo', $data);
    }

    public function allergenenInfo($productId)
    {
        $allergenenInfo = $this->magazijnModel->getAllergenenInfo($productId);

        if (empty($allergenenInfo['allergenen'])) {
            $data = [
                'title' => 'Overzicht Allergenen',
                'product' => $allergenenInfo['product'],
                'message' => "In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken",
                'redirect' => true,
                'redirectUrl' => URLROOT . '/magazijn/index',
                'redirectTime' => 4000
            ];
        } else {
            $data = [
                'title' => 'Overzicht Allergenen',
                'product' => $allergenenInfo['product'],
                'allergenen' => $allergenenInfo['allergenen']
            ];
        }

        $this->view('magazijn/allergeneninfo', $data);
    }
}