<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">
    <?php if (isset($data['redirect'])): ?>
        <div class="alert alert-info text-center">
            <?= $data['message']; ?>
        </div>
        <script>
            setTimeout(function() {
                window.location.href = '<?= $data['redirectUrl']; ?>';
            }, <?= $data['redirectTime']; ?>);
        </script>
    <?php else: ?>
        <div class="row mt-3">
            <div class="col-12">
                <h3><?= $data['title']; ?></h3>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <p><strong>Product ID:</strong> <?= $data['product']->ProductId; ?></p>
                <p><strong>Barcode:</strong> <?= $data['product']->Barcode; ?></p>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Naam</th>
                            <th>Beschrijving</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data['allergenen'] as $allergeen): ?>
                            <tr>
                                <td><?= $allergeen->Naam; ?></td>
                                <td><?= $allergeen->Beschrijving; ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <a href="<?= URLROOT; ?>/magazijn/index" class="btn btn-primary">Terug naar Overzicht</a>
            </div>
        </div>
    <?php endif; ?>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>