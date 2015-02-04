<?php $msg = empty($msg)? get_session_msg($this): $msg; ?>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta content="utf-8" http-equiv="encoding">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<?php echo base_url();?>favicon.ico" type="image/x-icon">
<link rel="icon" href="<?php echo base_url();?>favicon.ico" type="image/x-icon">

<title><?php echo SITE_TITLE;?>: Teacher List</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/jquery-ui.css"/>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.css"/>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.mobile.css" media="(max-width:790px)" />
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.tablet.css" media="(min-width:791px) and (max-width: 900px)" />
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.desktop.css" media="(min-width:901px)" />

<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.list.css"/>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.menu.css"/>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.shadowbox.css"/>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.pagination.css"/>

<!-- Javascript -->
<script type='text/javascript' src='<?php echo base_url();?>assets/js/jquery-2.1.1.min.js'></script>
<script type='text/javascript' src='<?php echo base_url();?>assets/js/jquery-ui.js'></script>
<script type='text/javascript' src='<?php echo base_url();?>assets/js/jquery.form.js'></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.js"></script> 
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.fileform.js"></script> 
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.menu.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.responsive.js"></script> 
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.list.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.shadowbox.js"></script> 
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.pagination.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.search.js"></script>
</head>

<body style="margin:0px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <?php $this->load->view("addons/secure_header");?>
  <tr>
    <td valign="top" colspan="2" class="bodyspace" style="padding-top:0px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td id="menucontainer"><?php $this->load->view("addons/menu");?></td>
        <td style="padding-left:15px;padding-top:15px; vertical-align:top;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
      		<tr>
              <td><div class="h1 grey nowrap listheader">Teacher<?php if(check_access($this, 'add_new_teacher', 'boolean')) echo "<div class='nextdiv addcontenticon' data-url='teacher/add'></div>";?></div><div class="listsearchfield"><input type="text" id="teachersearch__teacher" data-type="teacher" name="teachersearch__teacher" placeholder="Search Teacher" class="findfield" value=""/>
<input type='hidden' id='teachersearch__displaydiv' name='teachersearch__displaydiv' value='teachersearch__1' />
<input type='hidden' id='teachersearch__action' name='teachersearch__action' value='<?php echo base_url()."search/load_list/action/".(!empty($action)? $action: 'view');?>' />
</div></td></tr>
            <tr><td>
       
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td>
    <div id="listcontainer">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div id="paginationdiv__teachersearch_list" style="min-height:332px;">
    <div id="teachersearch__1"><?php $this->load->view('teacher/list', array(
	'listid'=>'teachersearch',
	'list'=>(!empty($list)? $list: array()), 
	'action'=>(!empty($action)? $action: ''), 
	'msg'=>(!empty($msg)? $msg: '') 
	));?></div></div></td>
  </tr>
  <?php if(!empty($list)){?>
  <tr>
    <td style="padding:40px 15px 10px 15px; "><div class='centerpagination' style="margin:0px;padding:0px;"><div id="teachersearch" class="paginationdiv"><div class="previousbtn" style='display:none;'>&#x25c4;</div><div class="selected">1</div><div class="nextbtn">&#x25ba;</div></div><input name="paginationdiv__teachersearch_action" id="paginationdiv__teachersearch_action" type="hidden" value="<?php echo base_url()."search/load_list/type/teacher/action/".(!empty($action)? $action: 'view');?>" />
<input name="paginationdiv__teachersearch_maxpages" id="paginationdiv__teachersearch_maxpages" type="hidden" value="5" />
<input name="paginationdiv__teachersearch_noperlist" id="paginationdiv__teachersearch_noperlist" type="hidden" value="<?php echo NUM_OF_ROWS_PER_PAGE;?>" />
<input name="paginationdiv__teachersearch_showdiv" id="paginationdiv__teachersearch_showdiv" type="hidden" value="paginationdiv__teachersearch_list" /></div></td>
  </tr>
  <?php }?>
</table>
</div>
   
    </td>
    </tr>
</table>
            
            </td></tr>
        </table></td>
      </tr>
     </table>
    </td>
  </tr>
  <?php $this->load->view("addons/secure_footer");?>
</table>

</body>
</html>