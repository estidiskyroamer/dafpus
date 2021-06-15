    <body>
        <div class="container-fluid">
            <div class="container">
                <div class="row"><h1>Grup</h1></div>
                <div class="mb-3 mt-3"><button class="btn btn-sm btn-primary" onclick="form_new_group()">Tambah grup</button></div>
                <div id="form_new_group" class="card" style="display:none;">
                    <div class="card-body">
                        <form id="new_group">
                            <div class="row">
                                <div class="col-sm-3">Nama Grup</div><div class="col-sm-9"><input class="form-control" type="text" name="nama" id="nama"></div>
                            </div>
                            
                            <div class="col-sm-3 mt-3"><button class="btn btn-sm btn-block btn-primary w-50" type="submit">Simpan</button><button onclick="cancel()" class="btn btn-sm btn-block w-50" type="reset">Batal</button></div>
                        </form>
                    </div>
                </div>
            </div> 
            <div id="content" class="container">
                <table class="table" id="table-reference_group">
                    <thead>
                        <tr><th>Grup</th><th>Jumlah Referensi</th><th>Aksi</th></tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>        
    </body>
    <script>
        $(document).ready(function(){
            get_group();
        })
        $('#new_group').submit(function (e) {
            e.preventDefault();

            var formData = {
                nama: $('#nama').val(),
                user: 'steady'
            }

            $.post('<?php echo base_url(); ?>referenceGroup/addGroup', formData, function(data) {
                get_group();
                form_new_group();
            }).fail(function() {
                alert('failed');
                form_new_group();
            })
        });
        function form_new_group(){
            $('#form_new_group').toggle();
        }

        function get_group(){
            $.get('<?php echo base_url(); ?>referenceGroup/getGroup', function(res) {
                var result = JSON.parse(res);
                $('#table-reference_group tbody').html('');
                $.each(result, function(i, e) {
                    $('#table-reference_group tbody').append(`<tr><td>${e.nama}</td><td>${e.jml_referensi}</td><td><div class="btn-group" role="group"><a class="btn btn-sm btn-primary" href="reference/index/${e.id}">Lihat Referensi</a> <a class="btn btn-sm btn-danger" href="#" onclick="del_group(\'${e.id}\')">Hapus</a></div></td></tr>`)
                });
                
            }).fail(function() {
                alert('failed');
            })
        }

        function del_group(id){
            var formData = {
                id: id
            }

            $.post('<?php echo base_url(); ?>referenceGroup/delGroup', formData, function(data) {
                get_group();
            }).fail(function() {
                alert('failed');
            })
        }

        function cancel(){
            $('#form_new_group').toggle();
            $('#nama').val('');
        }
    </script>
</html>