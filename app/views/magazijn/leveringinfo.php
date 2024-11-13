<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">
    <?php if (isset($data['redirect'])): ?>
        <div class="alert alert-warning text-center">
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
                <h3><?= $data['title']; ?> - <?= $data['product']->ProductNaam; ?></h3>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h5>Leverancier Informatie</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>Naam:</strong> <?= $data['leverancier']->Naam; ?></p>
                        <p><strong>Contactpersoon:</strong> <?= $data['leverancier']->Contactpersoon; ?></p>
                        <p><strong>Leveranciernummer:</strong> <?= $data['leverancier']->Leveranciernummer; ?></p>
                        <p><strong>Mobiel:</strong> <?= $data['leverancier']->MobielNummer; ?></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Datum Levering</th>
                            <th>Aantal Geleverd</th>
                            <th>Verwachte Leveringsdatum</th>
                            <th>Op Schema</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data['leveringen'] as $levering): ?>
                            <tr>
                                <td><?= date('d-m-Y', strtotime($levering->DatumLevering)); ?></td>
                                <td><?= $levering->AantalGeleverd; ?></td>
                                <td><?= date('d-m-Y', strtotime($levering->VerwachteLeveringsDatum)); ?></td>
                                <td>
                                    <?php 
                                    $opTijd = strtotime($levering->DatumLevering) <= strtotime($levering->VerwachteLeveringsDatum);
                                    echo $opTijd ? 
                                        '<span class="badge bg-success">Ja</span>' : 
                                        '<span class="badge bg-danger">Nee</span>';
                                    ?>
                                </td>
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