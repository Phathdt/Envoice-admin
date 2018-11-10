$ ->
  $('input.staff-toggle').change ->
    id = $(this).attr("data-id")
    $.post Routes.toggle_customer_user_path(id), (data, status) ->
