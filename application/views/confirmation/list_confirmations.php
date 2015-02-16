<?php $msg = empty($msg)? get_session_msg($this): $msg; 
if($action == 'post') $listName = "Post";
else if($action == 'view') $listName = "Application";
else  $listName = "Confirmation";
?>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta content="utf-8" http-equiv="encoding">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<?php echo base_url();?>favicon.ico" type="image/x-icon">
<link rel="icon" href="<?php echo base_url();?>favicon.ico" type="image/x-icon">

<title><?php echo SITE_TITLE;?>: <?php echo $listName;?> List</title>

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
<?php echo minify_js('confirmation-list_confirmations', array('jquery-2.1.1.min.js', 'jquery-ui.js', 'jquery.form.js', 'tmis.js', 'tmis.fileform.js', 'tmis.menu.js', 'tmis.responsive.js', 'tmis.list.js', 'tmis.shadowbox.js', 'tmis.pagination.js', 'tmis.search.js'));?>
</head>

<body style="margin:0px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <?php $this->load->view("addons/secure_header");?>
  <tr>
    <td valign="top" colspan="2" style="padding-top:0px;padding-left:15px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td id="menucontainer"><?php $this->load->view("addons/menu");?></td>
        <td class="bodyspace" style="padding-left:15px;padding-top:15px; vertical-align:top;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
      		<tr>
              <td><div class="h1 grey nowrap listheader"><?php echo $listName;?>s</div><div class="listsearchfield"><input type="text" id="confirmationsearch__confirmations" data-type="confirmation" name="confirmationsearch__confirmations" placeholder="Search <?php echo $listName;?>s" class="findfield" value=""/>
<input type='hidden' id='confirmationsearch__displaydiv' name='confirmationsearch__displaydiv' value='confirmationsearch__1' />
<input type='hidden' id='confirmationsearch__action' name='confirmationsearch__action' value='<?php echo base_url()."search/load_list/action/".(!empty($action)? $action: 'view');?>' />
</div></td></tr>
            <tr><td>
       
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr>
    <td>
    <div id="listcontainer">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div id="paginationdiv__confirmationsearch_list">
    <div id="confirmationsearch__1"><?php $this->load->view('confirmation/list', array(
	'listid'=>'confirmationsearch',
	'list'=>(!empty($list)? $list: array()), 
	'action'=>(!empty($action)? $action: ''), 
	'msg'=>(!empty($msg)? $msg: '') 
	));?></div></div></td>
  </tr>
  <?php if(!empty($list)){?>
  <tr>
    <td style="padding:40px 15px 10px 15px; "><div class='centerpagination' style="margin:0px;padding:0px;"><div id="confirmationsearch" class="paginationdiv"><div class="previousbtn" style='display:none;'>&#x25c4;</div><div class="selected">1</div><div class="nextbtn">&#x25ba;</div></div><input name="paginationdiv__confirmationsearch_action" id="paginationdiv__confirmationsearch_action" type="hidden" value="<?php echo base_url()."search/load_list/type/confirmation/action/".(!empty($action)? $action: 'view');?>" />
<input name="paginationdiv__confirmationsearch_maxpages" id="paginationdiv__confirmationsearch_maxpages" type="hidden" value="5" />
<input name="paginationdiv__confirmationsearch_noperlist" id="paginationdiv__confirmationsearch_noperlist" type="hidden" value="<?php echo NUM_OF_ROWS_PER_PAGE;?>" />
<input name="paginationdiv__confirmationsearch_showdiv" id="paginationdiv__confirmationsearch_showdiv" type="hidden" value="paginationdiv__confirmationsearch_list" /></div></td>
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