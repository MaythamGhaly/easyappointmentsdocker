<?php
/**
 * Local variables.
 *
 * @var bool $display_login_button
 */
?>

<div id="frame-footer">
    <small>
        <span class="footer-powered-by small">Appointments
        </span>

        <span class="footer-options">
            <!-- <span id="select-language" class="badge bg-secondary">
                <i class="fas fa-language me-2"></i>
                <?//= ucfirst(config('language')) ?>
            </span> -->
    
            <?php if ($display_login_button): ?>
                <a class="backend-link badge text-decoration-none px-2" style="background:#bb2121;border-color:white"
                   href="<?= session('user_id') ? site_url('calendar') : site_url('login') ?>">
                    <i class="fas fa-sign-in-alt me-2"></i>
                    <?= session('user_id') ? lang('backend_section') : lang('login') ?>
                </a>
            <?php endif; ?>
        </span>
    </small>
</div>
