// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@selectize/selectize"
import "administrate/components"
import Swal from "sweetalert2"
import "chartkick"
import "Chart.bundle"

Turbo.setConfirmMethod(async (title) => {
    const confirmation = await Swal.fire({
        title,
        confirmButtonText: "Yes",
        cancelButtonText: "No",
        showCancelButton: true
    })
    if (confirmation.isConfirmed)
        return true;
    else
        return false;
})