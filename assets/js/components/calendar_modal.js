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
 * Unavailabilities modal component.
 *
 * This module implements the unavailabilities modal functionality.
 *
 * Old Name: BackendCalendarUnavailabilityEventsModal
 */
App.Components.CalendarModal = (function () {
    const $export = $('#export');
    const $from = $('#from-date');
    const $to = $('#to-date')
    const $errorMessage = $('#error-mes')
    const moment = window.moment;

    /**
     * Update the displayed timezone.
     */
    // function updateTimezone() {
    //     const providerId = $selectProvider.val();

    //     const provider = vars('available_providers').find(
    //         (availableProvider) => Number(availableProvider.id) === Number(providerId),
    //     );

    //     if (provider && provider.timezone) {
    //         $unavailabilitiesModal.find('.provider-timezone').text(vars('timezones')[provider.timezone]);
    //     }
    // }

    /**
     * Add the component event listeners.
     */
    function addEventListeners() {
        /**
         * Event: Provider "Change"
         */
        // $selectProvider.on('change', () => {
        //     updateTimezone();
        // });

        /**
         * Event: Manage Unavailability Dialog Save Button "Click"
         *
         * Stores the unavailability period changes or inserts a new record.
         */
        $export.on('click', () => {

            if (!$from.val() || !$to.val()) {
                $errorMessage.removeClass('d-none');
                return;
            }
            

            if (!$from?.length) {
                throw new Error('Empty $target argument provided.');
            }
            const from = moment($from[0].value);

            
            if (!from.isValid()) {
                $errorMessage.removeClass('d-none');
                return;
            }

           if (!$to?.length) {
                throw new Error('Empty $target argument provided.');
            }
            const to = moment($to[0].value);

            if (!to.isValid()) {
                $errorMessage.removeClass('d-none');
                return;
            }

            if (from.isAfter(to)) {
                // Start time is after end time - display message to user.
                $errorMessage.removeClass('d-none');
                return;
            }

            // Unavailability period records go to the appointments table.
            const exportData = {
                from: from.format('YYYY-MM-DD'),
                to: to.format('YYYY-MM-DD')
            };

            // if ($id.val() !== '') {
            //     // Set the id value, only if we are editing an appointment.
            //     unavailability.id = $id.val();
            // }

            const successCallback = () => {
                // Display success message to the user.
                App.Layouts.Backend.displayNotification('report exported successfully');

                $errorMessage.addClass('d-none');
                // Close the modal dialog and refresh the calendar appointments.
                // $unavailabilitiesModal.find('.alert').addClass('d-none');

                // $unavailabilitiesModal.modal('hide');

                // $reloadAppointments.trigger('click');
            };

            App.Http.Calendar.exportReport(exportData, successCallback, null);
        });

        /**
         * Event : Insert Unavailability Time Period Button "Click"
         *
         * When the user clicks this button a popup dialog appears and the use can set a time period where
         * he cannot accept any appointments.
         */
        // $insertUnavailability.on('click', () => {
        //     resetModal();

        //     const $dialog = $('#unavailabilities-modal');

        //     // Set the default datetime values.
        //     const startMoment = moment();

        //     const currentMin = parseInt(startMoment.format('mm'));

        //     if (currentMin > 0 && currentMin < 15) {
        //         startMoment.set({minutes: 15});
        //     } else if (currentMin > 15 && currentMin < 30) {
        //         startMoment.set({minutes: 30});
        //     } else if (currentMin > 30 && currentMin < 45) {
        //         startMoment.set({minutes: 45});
        //     } else {
        //         startMoment.add(1, 'hour').set({minutes: 0});
        //     }

        //     if ($('.calendar-view').length === 0) {
        //         $selectProvider.val($selectFilterItem.val()).closest('.form-group').hide();
        //     }

        //     App.Utils.UI.setDateTimePickerValue($startDatetime, startMoment.toDate());
        //     App.Utils.UI.setDateTimePickerValue($endDatetime, startMoment.add(1, 'hour').toDate());

        //     $dialog.find('.modal-header h3').text(lang('new_unavailability_title'));
        //     $dialog.modal('show');
        // });
    }

    /**
     * Reset unavailability dialog form.
     *
     * Reset the "#unavailabilities-modal" dialog. Use this method to bring the dialog to the initial state
     * before it becomes visible to the user.
     */
    // function resetModal() {
    //     $id.val('');

    //     // Set default time values
    //     const start = App.Utils.Date.format(moment().toDate(), vars('date_format'), vars('time_format'), true);

    //     const end = App.Utils.Date.format(
    //         moment().add(1, 'hour').toDate(),
    //         vars('date_format'),
    //         vars('time_format'),
    //         true,
    //     );

    //     App.Utils.UI.initializeDateTimePicker($startDatetime);

    //     $startDatetime.val(start);

    //     App.Utils.UI.initializeDateTimePicker($endDatetime);

    //     $endDatetime.val(end);

    //     // Clear the unavailability notes field.
    //     $notes.val('');
    // }

    /**
     * Initialize the module.
     */
    function initialize() {
        // for (const index in vars('available_providers')) {
        //     const provider = vars('available_providers')[index];

        //     $selectProvider.append(new Option(provider.first_name + ' ' + provider.last_name, provider.id));
        // }

        addEventListeners();
    }

    document.addEventListener('DOMContentLoaded', initialize);

    // return {
    //     resetModal,
    // };
})();
