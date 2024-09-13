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
 * Calendar HTTP client.
 *
 * This module implements the calendar related HTTP requests.
 *
 * Old Name: BackendCalendarApi
 */
App.Http.Calendar = (function () {
    /**
     * Save Appointment
     *
     * This method stores the changes of an already registered appointment into the database, via an ajax call.
     *
     * @param {Object} appointment Contain the new appointment data. The ID of the appointment must be already included.
     * The rest values must follow the database structure.
     * @param {Object} [customer] Optional, contains the customer data.
     * @param {Function} [successCallback] Optional, if defined, this function is going to be executed on post success.
     * @param {Function} [errorCallback] Optional, if defined, this function is going to be executed on post failure.
     *
     * @return {*|jQuery}
     */
    function saveAppointment(appointment, customer, successCallback, errorCallback) {
        const url = App.Utils.Url.siteUrl('calendar/save_appointment');

        const data = {
            csrf_token: vars('csrf_token'),
            appointment_data: appointment,
        };

        if (customer) {
            data.customer_data = customer;
        }

        return $.post(url, data)
            .done((response) => {
                if (successCallback) {
                    console.log(response)
                    successCallback(response);
                }
            })
            .fail(() => {
                if (errorCallback) {
                    errorCallback();
                }
            });
    }

    /**
     * Remove an appointment.
     *
     * @param {Number} appointmentId
     * @param {String} cancellationReason
     *
     * @return {*|jQuery}
     */
    function deleteAppointment(appointmentId, cancellationReason) {
        const url = App.Utils.Url.siteUrl('calendar/delete_appointment');

        const data = {
            csrf_token: vars('csrf_token'),
            appointment_id: appointmentId,
            cancellation_reason: cancellationReason,
        };

        return $.post(url, data);
    }

    /**
     * Save unavailability period to database.
     *
     * @param {Object} unavailability Contains the unavailability period data.
     * @param {Function} [successCallback] The ajax success callback function.
     * @param {Function} [errorCallback] The ajax failure callback function.
     *
     * @return {*|jQuery}
     */
    function saveUnavailability(unavailability, successCallback, errorCallback) {
        const url = App.Utils.Url.siteUrl('calendar/save_unavailability');

        const data = {
            csrf_token: vars('csrf_token'),
            unavailability: unavailability,
        };

        return $.post(url, data)
            .done((response) => {
                if (successCallback) {
                    successCallback(response);
                }
            })
            .fail(() => {
                if (errorCallback) {
                    errorCallback();
                }
            });
    }
    function exportReport(exportData, successCallback, errorCallback) {
        const url = App.Utils.Url.siteUrl('calendar/export');

        const data = {
            csrf_token: vars('csrf_token'),
            exportData: exportData,
        };

        return $.post(url, data)
            .done((response) => {
                if (successCallback) {
                    console.log(response)
                    const csvContent = formatCSV(response.data);
                    downloadCSV(csvContent, 'report.csv');
                    successCallback(response);
                }
            })
            .fail(() => {
                if (errorCallback) {
                    errorCallback();
                }
            });
    }
    function formatCSV(data) {
        // Define the CSV header
        const headers = [
            'Patient ID',
            'Name',
            'Phone',
            'Date',
            'Time',
            'Duration',
            'Doctor',
            'Notes',
            'Type',
            'Status'
        ];

        // Format the data rows
        const rows = data.map((item) => {
            const startDate = new Date(item.start_datetime);
            const endDate = new Date(item.end_datetime);
            const duration = ((endDate - startDate) / (1000 * 60)).toFixed(0) + ' mins'; // Duration in minutes

            return [
                item.patient_file_number || '',                             // Patient ID
                `${item.patient_first_name} ${item.patient_last_name}`,     // Name
                item.patient_phone_number || '',                           // Phone
                startDate.toISOString().split('T')[0],                    // Date
                startDate.toTimeString().split(' ')[0],                   // Time
                duration,                                                 // Duration
                `${item.doctor_first_name} ${item.doctor_last_name}`,     // Doctor
                item.notes || '',                                         // Notes
                item.service_name || '',                                  // Type
                item.status || ''                                         // Status
            ].join(',');
        });

        // Combine headers and rows into CSV format
        return [headers.join(','), ...rows].join('\n');
    }

    function downloadCSV(csvContent, filename) {
        const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');

        if (navigator.msSaveBlob) { // For IE 10+
            navigator.msSaveBlob(blob, filename);
        } else {
            const url = URL.createObjectURL(blob);
            link.setAttribute('href', url);
            link.setAttribute('download', filename);
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    }
    /**
     * Remove an unavailability.
     *
     * @param {Number} unavailabilityId
     *
     * @return {*|jQuery}
     */
    function deleteUnavailability(unavailabilityId) {
        const url = App.Utils.Url.siteUrl('calendar/delete_unavailability');

        const data = {
            csrf_token: vars('csrf_token'),
            unavailability_id: unavailabilityId,
        };

        return $.post(url, data);
    }

    /**
     * Save working plan exception of work to database.
     *
     * @param {Date} date Contains the working plan exceptions data.
     * @param {Object} workingPlanException Contains the working plan exceptions data.
     * @param {Number} providerId Contains the working plan exceptions data.
     * @param {Function} successCallback The ajax success callback function.
     * @param {Function} errorCallback The ajax failure callback function.
     * @param {Date} [originalDate] On edit, provide the original date.
     *
     * @return {*|jQuery}
     */
    function saveWorkingPlanException(
        date,
        workingPlanException,
        providerId,
        successCallback,
        errorCallback,
        originalDate,
    ) {
        const url = App.Utils.Url.siteUrl('calendar/save_working_plan_exception');

        const data = {
            csrf_token: vars('csrf_token'),
            date: date,
            working_plan_exception: workingPlanException,
            provider_id: providerId,
            original_date: originalDate,
        };

        return $.post(url, data)
            .done((response) => {
                if (successCallback) {
                    successCallback(response);
                }
            })
            .fail(() => {
                if (errorCallback) {
                    errorCallback();
                }
            });
    }

    /**
     * Delete working plan exception
     *
     * @param {String} date
     * @param {Number} providerId
     * @param {Function} [successCallback]
     * @param {Function} [errorCallback]
     *
     * @return {*|jQuery}
     */
    function deleteWorkingPlanException(date, providerId, successCallback, errorCallback) {
        const url = App.Utils.Url.siteUrl('calendar/delete_working_plan_exception');

        const data = {
            csrf_token: vars('csrf_token'),
            date: date,
            provider_id: providerId,
        };

        return $.post(url, data)
            .done((response) => {
                if (successCallback) {
                    successCallback(response);
                }
            })
            .fail(() => {
                if (errorCallback) {
                    errorCallback();
                }
            });
    }

    /**
     * Get the appointments for the displayed calendar period.
     *
     * @param {Number} recordId Record ID (provider or service).
     * @param {String} filterType The filter type, could be either "provider" or "service".
     * @param {String} startDate Visible start date of the calendar.
     * @param {String} endDate Visible end date of the calendar.
     *
     * @returns {jQuery.jqXHR}
     */
    function getCalendarAppointments(recordId, startDate, endDate, filterType) {
        const url = App.Utils.Url.siteUrl('calendar/get_calendar_appointments');

        const data = {
            csrf_token: vars('csrf_token'),
            record_id: recordId,
            start_date: moment(startDate).format('YYYY-MM-DD'),
            end_date: moment(endDate).format('YYYY-MM-DD'),
            filter_type: filterType,
        };

        return $.post(url, data);
    }

    /**
     * Get the calendar appointments for the table view (different data structure).
     *
     * @param {Date} startDate
     * @param {Date} endDate
     *
     * @return {*|jQuery}
     */
    function getCalendarAppointmentsForTableView(startDate, endDate) {
        const url = App.Utils.Url.siteUrl('calendar/get_calendar_appointments_for_table_view');

        const data = {
            csrf_token: vars('csrf_token'),
            start_date: moment(startDate).format('YYYY-MM-DD'),
            end_date: moment(endDate).format('YYYY-MM-DD'),
        };

        return $.post(url, data);
    }

    return {
        saveAppointment,
        deleteAppointment,
        saveUnavailability,
        deleteUnavailability,
        saveWorkingPlanException,
        deleteWorkingPlanException,
        getCalendarAppointments,
        getCalendarAppointmentsForTableView,
        exportReport,
    };
})();
