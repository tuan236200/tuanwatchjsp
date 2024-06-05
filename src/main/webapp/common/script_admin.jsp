<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/assets/admin/plugins/jquery/jquery.min.js"></script>
<script src="/assets/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="/assets/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/admin/plugins/chart.js/Chart.min.js"></script>
<script src="/assets/admin/plugins/sparklines/sparkline.js"></script>
<script src="/assets/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/assets/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<script src="/assets/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
<script src="/assets/admin/plugins/moment/moment.min.js"></script>
<script src="/assets/admin/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/assets/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<script src="/assets/admin/plugins/summernote/summernote-bs4.min.js"></script>
<script src="/assets/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<script src="/assets/admin/dist/js/adminlte.js?v=3.2.0"></script>
<script src="/assets/admin/dist/js/pages/dashboard.js"></script>

<script src="/assets/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/assets/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/assets/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/assets/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/assets/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/assets/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/assets/admin/plugins/jszip/jszip.min.js"></script>
<script src="/assets/admin/plugins/pdfmake/pdfmake.min.js"></script>
<script src="/assets/admin/plugins/pdfmake/vfs_fonts.js"></script>
<script src="/assets/admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/assets/admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/assets/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="/assets/admin/dist/js/demo.js"></script>

<script>
	$.widget.bridge('uibutton', $.ui.button)
</script>

<script>
  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>