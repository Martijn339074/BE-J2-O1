<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">
    <div class="row mt-3" style="<?= $data['messageVisibility']; ?>">
        <div class="col-12 text-center">
            <div class="alert alert-<?= $data['messageColor']; ?>" role="alert">
                <?= $data['message']; ?>
            </div>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <h3><?= $data['title']; ?></h3>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ProductId</th>
                        <th>Verpakkings Eenheid</th>
                        <th>Aantal Aanwezig</th>
                        <th>Status</th>
                        <th>Opmerkingen</th>
                        <th>Datum Aangemaakt</th>
                        <th>Leverantie Info</th>
                        <th>Allergenen Info</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($data['magazijns'] as $magazijn): ?>
                        <tr>
                            <td><?= $magazijn->ProductId; ?></td>
                            <td><?= $magazijn->VerpakkingsEenheid; ?></td>
                            <td><?= $magazijn->AantalAanwezig; ?></td>
                            <td><?= $magazijn->IsActief ? 'Actief' : 'Inactief'; ?></td>
                            <td><?= $magazijn->Opmerkingen; ?></td>
                            <td><?= $magazijn->DatumAangemaakt; ?></td>
                            <td>
                                <a href="<?= URLROOT; ?>/magazijn/leveringinfo/<?= $magazijn->Id; ?>"
                                    class="btn btn-sm btn-info">
                                    <i class="fas fa-question-circle"></i>
                                </a>
                            </td>
                            <td>
                                <a href="<?= URLROOT; ?>/magazijn/allergeneninfo/<?= $magazijn->Id; ?>"
                                    class="btn btn-sm btn-danger">
                                    <i class="fas fa-times"></i>
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <a href="<?= URLROOT; ?>/homepages/index" class="btn btn-primary">Homepage</a>
        </div>
    </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>