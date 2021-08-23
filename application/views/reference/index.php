    <body>
        <div class="container-fluid">
            <div class="container">
                <div class="row"><h1>Referensi</h1></div>
                <?php if(isset($reference_group)) { ?>
                <div class="row"><h2>Grup <?php echo $reference_group[0]->nama; ?></h2> <a href="<?php echo base_url(); ?>reference">Lihat semua referensi</a></div>
                <input type='hidden' id="group_id" value="<?php if(isset($reference_group)) echo $reference_group[0]->id; ?>">
                <?php } ?>
                <div class="mb-3 mt-3">
                    <button class="btn btn-sm btn-primary" onclick="form_new_reference()">Tambah referensi</button>
                    <?php if(isset($reference_group)) { ?>
                    <button class="btn btn-sm btn-primary" onclick="form_bibliography()">Buat daftar pustaka</button>
                    <?php } ?>
                </div>
                <div id="form_new_reference" style="display:none;">
                    <div class="card">
                        <form id="new_reference">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">Jenis Referensi</div>
                                    <div class="col-sm-9"><select class="form-select" name='select_type' id='select_type'>
                                    <option value="" selected>--Pilih jenis referensi--</option>
                                    <?php foreach($type as $t) { ?>
                                        <option value="<?php echo $t->id; ?>"><?php echo $t->nama_type; ?></option>
                                    <?php } ?>
                                    </select></div>
                                </div>
                                <input type='hidden' name='id' id='id'>
                                <input type='hidden' name='type_id' id='type_id'>
                                <input type='hidden' name='reference_group_id' id='reference_group_id' value=''>
                                <div id='reference_fields'></div>
                                
                                <div class="row" id="new_reference_group">
                                    <div class="col-sm-3">Grup</div>
                                    <div class="col-sm-9"><select class="form-select" name='new_group' id='new_group'>
                                    <option value="" selected>--Pilih grup--</option>
                                    <?php foreach($all_group as $g) { ?>
                                        <option value="<?php echo $g->id; ?>"><?php echo $g->nama; ?></option>
                                    <?php } ?>
                                    </select></div>
                                </div>

                                <div class="col-md-3 col-12 mt-3"><button class="btn btn-sm btn-block btn-primary w-50" type="submit">Simpan</button><button onclick="cancel()" class="btn btn-sm btn-block w-50" type="reset">Batal</button></div>
                            </div>                        
                        </form>
                    </div>
                </div>
                <div id="form_bibliography" style="display:none;">
                    <div class="card">
                        <form id="gen_bib">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">Style</div>
                                    <div class="col-sm-9"><select class="form-select" name='style_id' id='style_id'>
                                    <option value="" selected>--Pilih style--</option>
                                    <?php foreach($style as $s) { ?>
                                        <option value="<?php echo $s->id; ?>"><?php echo $s->nama_style; ?></option>
                                    <?php } ?>
                                    </select></div>
                                </div>
                                <div class="col-md-3 col-12 mt-3"><button class="btn btn-sm btn-block btn-primary w-50" type="submit">Tampilkan</button><button onclick="cancel()" class="btn btn-sm btn-block w-50" type="reset">Batal</button></div>
                            </div>                        
                        </form>
                    </div>
                </div>
            </div>
            <div id="content" class="container">
                <table class="table" id="table-reference">
                    <thead>
                        <tr><th width = '70%'>Referensi</th><th>Jenis</th><th>Grup</th><th>Aksi</th></tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            <div id="bibliography" class="container" style="display:none">
                <div class="card">
                    <div class="card-body">
                        <small id="bib-style" class="text-muted"></small>
                        <h3 class="card-title">Daftar Pustaka</h3><div class="float-right"><button class="btn btn-sm btn-primary" id="btn_copy" data-clipboard-target="#daftar_isi">Copy</button></div>
                        <div class="card-text" id="daftar_isi"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <style>
        .field_input {
            text-transform: capitalize;
        }
    </style>
    <script>
        $(document).ready(function(){
            get_reference();
            $('#new_group').val($('#group_id').val());
        })

        new ClipboardJS('#btn_copy');

        var fields;

        $('#new_reference').submit(function (e) {
            e.preventDefault();

            var fieldData = "{";
            $.each(fields, function(i, obj) {
                var input = $(`#inp_${obj}`).val();
                if($('#isCorporate').prop('checked')) {
                    if(obj=='penulis') input = input+'-corporate';
                }
                if(i === fields.length - 1){
                    fieldData+= `\\"${obj}\\":\\"${input}\\"`;
                }
                else{
                    fieldData+= `\\"${obj}\\":\\"${input}\\", `;
                }
            });
            fieldData+= "}";

            var formData = {
                id          : $('#id').val(),
                reference_group_id  : $('#reference_group_id').val(),
                type_id     : $('#type_id').val(),
                content     : fieldData,
                user        : 'steady'
            }
            $(this).trigger('reset');
            $.post('<?php echo base_url(); ?>reference/addReference', formData, function(data) {
                get_reference();
                form_new_reference();
            }).fail(function() {
                alert('failed');
                form_new_reference();
            })
        });

        $('#gen_bib').submit(function (e) {
            e.preventDefault();

            var formData = {
                style_id    : $('#style_id').val(),
                reference_group_id  : $('#group_id').val(),
                user        : 'steady'
            }

            $.post('<?php echo base_url(); ?>bibliography/generateBibliography', formData, function(data) {
                form_bibliography();
                gen_bibliography(data);
            }).fail(function() {
                alert('failed');
                form_bibliography();
            })
        });

        $('#select_type').change(function() {
            var data = {
                id : $(this).val()
            }
            $.get('<?php echo base_url(); ?>type/getType', data, function(res) {
                var param = JSON.parse(res);
                param = param[0];
                $('#type_id').val(param.id);
                fields = JSON.parse(param.fields);
                console.log(fields);
                var form_fields = '';
                $.each(fields, function(i, obj) {
                    form_fields+= `<div class="row"><div class="col-sm-3 field_input">${obj}</div><div class="col-sm-7"><input class="form-control" type="text" name="inp_${obj}" id="inp_${obj}"></div>`;
                    if(obj == 'penulis') {
                        form_fields+= '<div class="col-sm-2 form-check"><input class="form-check-input" type="checkbox" value="1" id="isCorporate"><label class="form-check-label" for="isCorporate">Lembaga</label></div>';
                    }
                    form_fields+= '</div>';
                });
                $('#reference_fields').html(form_fields);
            })            
        });

        $('#new_group').change(function() {
            $('#reference_group_id').val($(this).val());
        })

        function form_new_reference(){
            $('#form_new_reference').toggle();
            $('#reference_group_id').val($('#group_id').val());
            $('#reference_fields').html('');
        }

        function form_bibliography(){
            $('#form_bibliography').toggle();
        }

        function get_reference(){
            var formData = {
                reference_group_id  : $('#group_id').val()
            }
            $.post('<?php echo base_url(); ?>reference/getReference', formData, function(res) {
                var result = JSON.parse(res);
                $('#table-reference tbody').html('');
                $.each(result, function(i, e) {
                    var grup = `<a href="<?php echo base_url(); ?>reference/index/${e.reference_group_id}">${e.grup}</a>`;
                    if(e.grup==null) {
                        grup = '';
                    }
                    $('#table-reference tbody').append(`<tr><td>${e.referensi}</td><td>${e.nama_type}</td><td>${grup}</td><td><div class="btn-group" role="group"><a href="#" class="btn btn-sm btn-primary" onclick="edit_reference(\'${e.id}\')">Edit Referensi</a> <a href="#" class="btn btn-sm btn-danger" onclick="del_reference(\'${e.id}\')">Hapus</a></div></td></tr>`)
                });
                
            }).fail(function() {
                alert('failed');
            })
        }

        function edit_reference(id){            
            $('#form_new_reference').show();

            var data = {
                id  : id
            }

            $.post('<?php echo base_url(); ?>reference/getReference', data, function(res) {                
                var result = JSON.parse(res);
                fields = [];
                var form_fields = '<br>';
                var content = JSON.parse(result[0].content);
                $.each(content, function(i, obj) {
                    fields.push(i);
                    var temp_obj = obj;
                    if(temp_obj.indexOf('-corporate') >= 0) {
                        temp_obj = temp_obj.replace('-corporate', '');
                    }
                    form_fields+= `<div class="row"><div class="col-sm-3 field_input">${i}</div><div class="col-sm-7"><input class="form-control" type="text" name="inp_${i}" id="inp_${i}" value="${temp_obj}"></div>`;
                    if(i == 'penulis') {
                        if(obj.indexOf('-corporate') >= 0){
                            form_fields+= '<div class="col-sm-2 form-check"><input class="form-check-input" type="checkbox" value="1" checked id="isCorporate"><label class="form-check-label" for="isCorporate">Lembaga</label></div>';
                        }
                        else{
                            form_fields+= '<div class="col-sm-2 form-check"><input class="form-check-input" type="checkbox" value="1" id="isCorporate"><label class="form-check-label" for="isCorporate">Lembaga</label></div>';                            
                        }
                    }
                    form_fields+= '</div>';
                });
                console.log(fields);
                $('#select_type').val(result[0].type_id);
                $('#type_id').val(result[0].type_id);
                $('#id').val(result[0].id);
                $('#new_group').val(result[0].reference_group_id);
                $('#reference_group_id').val(result[0].reference_group_id);
                $('#reference_fields').html(form_fields);
            })
        }

        function del_reference(id) {
            var formData = {
                id : id
            }
            $.post('<?php echo base_url(); ?>reference/delReference', formData, function(res) {
                get_reference();
            }).fail(function() {
                alert('failed');
            })
        }

        function gen_bibliography(res) {
            var result = JSON.parse(res);
            $('#bibliography .card-text').html('');
            $.each(result.bib, function(i, obj) {
                $('#bibliography .card-text').append('<p>'+obj+'</p>');
            })
            console.log(result);
            $('#bibliography #bib-style').html(result.style.nama_style + ' style');
            $('#bibliography').show();
        }

        function cancel(){
            $('#form_new_reference').toggle();
            $('#reference_fields').html('');
            $('#nama').val('');
        }
    </script>
</html>