<!doctype html>
<html lang="<?= config('language_code') ?>">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <title>Doctors Without Borders</title>

    <link rel="icon" type="image/x-icon" href="<?= asset_url('assets/img/doctorslogo.png') ?>">
    <link rel="stylesheet" type="text/css" href="<?= asset_url('assets/css/themes/default.min.css') ?>">
    <link rel="stylesheet" type="text/css" href="<?= asset_url('assets/css/general.css') ?>">
    <link rel="stylesheet" type="text/css" href="<?= asset_url('assets/css/pages/installation.css') ?>">
</head>

<body>
    <div id="loading" class="d-none">
        <img src="<?= base_url('assets/img/loading.gif') ?>" alt="loading">
    </div>

    <header>
        <div class="container">
            <h1 class="page-title">Doctors without borders</h1>
        </div>
    </header>

    <div class="content container">
        <div class="welcome card shadow p-4 mb-5">
            <h3 class="mb-3 text-center">Welcome to Doctors Without Borders</h3>
            <div class="instructions">
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <i class="fas fa-download text-primary"></i>
                        Download the database SQL file from
                        <a href="/storage/easyappointments.sql" class="text-primary" download>here</a>.
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-database text-danger"></i>
                        Open <strong><a class="text-danger" href="http://localhost:8080/index.php?route=/database/structure&db=easyappointments">phpMyAdmin</a></strong>.
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-file-import text-success"></i>
                        Go to the "Import" section and upload the SQL file you downloaded.
                    </li>
                    <li class="mb-2">
                        <i class="fas fa-sync-alt text-info"></i>
                        Reload this page once the import is complete.
                    </li>
                </ul>
                <p class="note mt-4">
                    <strong>Note:</strong> Remember to use the
                    <a href="<?= site_url('user/login') ?>" class="text-primary">
                        login URL
                    </a> to access the backend section of the Appointments Software.
                </p>
            </div>
        </div>

        <!-- <div class="alert" hidden></div> -->

        <!-- <div class="row">
            <div class="admin-settings col-12 col-sm-5">
                <h3 class="text-black-50 mb-3 fw-light">Administrator</h3>

                <div class="mb-3">
                    <label class="form-label" for="first-name">
                        <?//= lang('first_name') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="first-name" class="form-control required" maxlength="256">
                </div>

                <div class="mb-3">
                    <label class="form-label" for="last-name">
                        <?//= lang('last_name') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="last-name" class="form-control required" maxlength="512">
                </div>

                <div class="mb-3">
                    <label class="form-label" for="email">
                        <?//= lang('email') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="email" class="form-control required" maxlength="512">
                </div>

                <div class="mb-3">
                    <label class="form-label" for="phone-number">
                        <?//= lang('phone_number') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="phone-number" class="form-control required" maxlength="128">
                </div>

                <div class="mb-3">
                    <label class="form-label" for="username">
                        <?//= lang('username') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="username" class="form-control required" maxlength="256">
                </div>

                <div class="mb-3">
                    <label class="form-label" for="password">
                        <?//= lang('password') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input type="password" id="password" class="form-control required" maxlength="512">
                </div>

                <div class="mb-3">
                    <label class="form-label" for="password-confirm">
                        <?//= lang('retype_password') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input type="password" id="password-confirm" class="form-control required" maxlength="512">
                </div>

                <div class="mb-3">
                    <label class="form-label" for="language">
                        <?//= lang('language') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <select id="language" class="form-select required">
                        <?php
                        //$config_lang = config('language');
                        //foreach (vars('available_languages') as $lang): ?>
                            <option value="<?//= $lang ?>" <?//= $lang == $config_lang ? ' selected' : '' ?>>
                                <?//= ucfirst($lang) ?>
                            </option>
                        <?php // endforeach;
                        ?>
                    </select>
                </div>

            </div>

            <div class="company-settings col-12 col-sm-5">
                <h3 class="text-black-50 mb-3 fw-light"><?//= lang('company') ?></h3>

                <div class="mb-3">
                    <label class="form-label" for="company-name">
                        <?//= lang('company_name') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="company-name" data-field="company_name" class="required form-control">
                    <div class="form-text text-muted">
                        <small>
                            <?//= lang('company_name_hint') ?>
                        </small>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="company-email">
                        <?//= lang('company_email') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="company-email" data-field="company_email" class="required form-control">
                    <div class="form-text text-muted">
                        <small>
                            <?//= lang('company_email_hint') ?>
                        </small>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label" for="company-link">
                        <?//= lang('company_link') ?>
                        <span class="text-danger">*</span>
                    </label>
                    <input id="company-link" data-field="company_link" class="required form-control">
                    <div class="form-text text-muted">
                        <small>
                            <?//= lang('company_link_hint') ?>
                        </small>
                    </div>
                </div>

            </div>
        </div> -->

        <!-- <br>

        <p>
            You will be able to set your business logic in the backend settings page after the installation is complete.
            <br>
            Press the following button to complete the installation process.
        </p>

        <br>

        <br>

        <button type="button" id="install" class="btn btn-primary" style="background:#bb2121;border-color:white">
            <i class="icon-white icon-ok me-2"></i>
            Install Easy!Appointments
        </button> -->
    </div>

    <footer>
        <!-- Powered by <a href="https://easyappointments.org">Easy!Appointments</a> -->
    </footer>

    <?php component('js_vars_script'); ?>
    <?php component('js_lang_script'); ?>

    <script src="<?= asset_url('assets/vendor/jquery/jquery.min.js') ?>"></script>
    <script src="<?= asset_url('assets/vendor/@popperjs-core/popper.min.js') ?>"></script>
    <script src="<?= asset_url('assets/vendor/bootstrap/bootstrap.min.js') ?>"></script>

    <script src="<?= asset_url('assets/js/app.js') ?>"></script>
    <script src="<?= asset_url('assets/js/utils/message.js') ?>"></script>
    <script src="<?= asset_url('assets/js/utils/validation.js') ?>"></script>
    <script src="<?= asset_url('assets/js/utils/url.js') ?>"></script>
    <script src="<?= asset_url('assets/js/pages/installation.js') ?>"></script>

</body>

</html>