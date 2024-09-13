<?php defined('BASEPATH') or exit('No direct script access allowed');

/* ----------------------------------------------------------------------------
 * Easy!Appointments - Online Appointment Scheduler
 *
 * @package     EasyAppointments
 * @author      A.Tselegidis <alextselegidis@gmail.com>
 * @copyright   Copyright (c) Alex Tselegidis
 * @license     https://opensource.org/licenses/GPL-3.0 - GPLv3
 * @link        https://easyappointments.org
 * @since       v1.5.0
 * ---------------------------------------------------------------------------- */

/**
 * Google Analytics settings controller.
 *
 * Handles Google Analytics settings related operations.
 *
 * @package Controllers
 */
class Google_analytics_settings extends EA_Controller
{
    /**
     * Google_analytics_settings constructor.
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('settings_model');

        $this->load->library('accounts');
    }

    /**
     * Render the settings page.
     */
    public function index(): void
    {
        session(['dest_url' => site_url('google_analytics_settings')]);

        $user_id = session('user_id');

        if (cannot('view', PRIV_SYSTEM_SETTINGS)) {
            if ($user_id) {
                abort(403, 'Forbidden');
            }

            redirect('login');

            return;
        }

        $role_slug = session('role_slug');

        script_vars([
            'user_id' => $user_id,
            'role_slug' => $role_slug,
            'google_analytics_settings' => $this->settings_model->get('name like "google_analytics_%"'),
        ]);

        html_vars([
            'page_title' => lang('google_analytics'),
            'active_menu' => PRIV_SYSTEM_SETTINGS,
            'user_display_name' => $this->accounts->get_user_display_name($user_id),
        ]);

        $this->load->view('pages/google_analytics_settings');
    }

    /**
     * Save general settings.
     */
    public function save(): void
    {
        try {
            if (cannot('edit', PRIV_SYSTEM_SETTINGS)) {
                throw new RuntimeException('You do not have the required permissions for this task.');
            }

            $settings = request('google_analytics_settings', []);

            foreach ($settings as $setting) {
                $existing_setting = $this->settings_model
                    ->query()
                    ->where('name', $setting['name'])
                    ->get()
                    ->row_array();

                if (!empty($existing_setting)) {
                    $setting['id'] = $existing_setting['id'];
                }

                $this->settings_model->save($setting);
            }

            response();
        } catch (Throwable $e) {
            json_exception($e);
        }
    }
}
