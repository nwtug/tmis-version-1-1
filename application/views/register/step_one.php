<!DOCTYPE html>
<html>
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
<meta content="utf-8" http-equiv="encoding">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<?php echo base_url();?>favicon.ico" type="image/x-icon">
<link rel="icon" href="<?php echo base_url();?>favicon.ico" type="image/x-icon">

<title><?php echo SITE_TITLE;?>: Register</title>

<!-- Stylesheets -->
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/jquery-ui.css"/>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.css"/>
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.mobile.css" media="(max-width:790px)" />
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.tablet.css" media="(min-width:791px) and (max-width: 900px)" />
<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.desktop.css" media="(min-width:901px)" />

<link rel="stylesheet" href="<?php echo base_url();?>assets/css/tmis.list.css"/>

<!-- Javascript -->
<script type='text/javascript' src='<?php echo base_url();?>assets/js/jquery-2.1.1.min.js'></script>
<script type='text/javascript' src='<?php echo base_url();?>assets/js/jquery-ui.js'></script>
<script type='text/javascript' src='<?php echo base_url();?>assets/js/jquery.form.js'></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.js"></script> 
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.callout.js"></script> 
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.fileform.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/js/tmis.responsive.js"></script> 

</head>

<body style="margin:0px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <?php $this->load->view("addons/public_header", array("page"=>"register"));?>
  <tr>
    <td valign="top" colspan="2" class="bodyspace">
    <form id="home_registration_form" method="post" autocomplete="off" action="<?php echo base_url();?>register/step_one" class='simplevalidator'>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
      <td class="h1 grey">Teacher Registration</td>
     </tr>
     <tr>
     <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0" id="stepstracker">
     	<tr>
    		<td class='stepone visited'><div>&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div></td>
     		<td class='unvisitedfiller'>&nbsp;</td>
     		<td class='steptwo unvisited'><div>&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div></td>
     		<td class='unvisitedfiller'>&nbsp;</td>
     		<td class='stepthree unvisited'><div>&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div></td>
     		<td class='unvisitedfiller'>&nbsp;</td>
     		<td class='stepfour unvisited'><div>&nbsp;</div><div>&nbsp;</div><div>&nbsp;</div></td>
     	</tr>
     	<tr>
     		<td class='visited'>Personal Information</td>
     		<td>&nbsp;</td>
     		<td class='unvisited'>Identification &amp; Contacts</td>
     		<td>&nbsp;</td>
     		<td class='unvisited'>Education &amp; Qualifications</td>
     		<td>&nbsp;</td>
    		<td class='unvisited'>Preview &amp; Submit</td>
     	</tr>
     </table>
     </td>
     </tr>
     
     <?php echo !empty($msg)?"<tr><td>".format_notice($this,$msg)."</td></tr>": "";?>
     
     <tr>
      <td>
      
        <table border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td class="label">Surname:</td>
    <td><input type="text" id="lastname" name="lastname" title="Surname" class="textfield" value="<?php echo ($this->native_session->get('lastname')? $this->native_session->get('lastname'): '');?>"/></td>
  </tr>
  <tr>
    <td class="label">Other Names:</td>
    <td><input type="text" id="firstname" name="firstname" title="Other Names" class="textfield" value="<?php echo ($this->native_session->get('firstname')? $this->native_session->get('firstname'): '');?>"/></td>
  </tr>
  <tr>
    <td class="label">Telephone:</td>
    <td><input type="text" id="telephone" name="telephone" title="Telephone" placeholder="Optional" maxlength="16" class="textfield numbersonly optional" value="<?php echo ($this->native_session->get('telephone')? $this->native_session->get('telephone'): '');?>"/></td>
  </tr>
  <tr>
    <td class="label">Email Address:</td>
    <td><?php if($this->native_session->get('person_id')){
			echo "<span class='value'>".$this->native_session->get('emailaddress')."</span>";
		 } else {?>
         <input type="text" id="emailaddress" name="emailaddress" title="Email Address" class="textfield email" value="<?php echo ($this->native_session->get('emailaddress')? $this->native_session->get('emailaddress'): '');?>"/>
         <?php }?></td>
  </tr>
  <tr>
    <td class="label">Gender:</td>
    <td><div class="nextdiv"><input type="radio" name="gender" id="gender_female" value="female" <?php echo ($this->native_session->get('gender') && $this->native_session->get('gender')=='female'? 'checked': '');?>>
       <label for="gender_female">Female</label></div>
       <div class="nextdiv"><input type="radio" name="gender" id="gender_male" value="male" <?php echo ($this->native_session->get('gender') && $this->native_session->get('gender')=='male'? 'checked': '');?>>
       <label for="gender_male">Male</label></div></td>
  </tr>
  <tr>
    <td class="label">Marital Status:</td>
    <td><div class="nextdiv"><input type="radio" name="marital" id="marital_married" value="married" <?php echo ($this->native_session->get('marital') && $this->native_session->get('marital')=='married'? 'checked': '');?>>
       <label for="marital_married">Married</label></div>
       <div class="nextdiv"><input type="radio" name="marital" id="marital_single" value="single" <?php echo ($this->native_session->get('marital') && $this->native_session->get('marital')=='single'? 'checked': '');?>>
       <label for="marital_single">Single</label></div></td>
  </tr>
  <tr>
    <td class="label">Birth Day:</td>
    <td><input type="text" id="birthday" name="birthday" title="Birth Day" class="textfield datefield birthday" value="<?php echo ($this->native_session->get('birthday')? $this->native_session->get('birthday'): '');?>" readonly/></td>
  </tr>
  <tr>
    <td class="label">Birth Place:</td>
    <td><input type="text" id="birthplace" name="birthplace" title="Birth Place" class="textfield placefield physical" value="<?php echo ($this->native_session->get('birthplace__addressline')? $this->native_session->get('birthplace__addressline'): '');?>" readonly/></td>
  </tr>
</table>
        
      </td>
     </tr>
     <tr>
      <td>
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class='buttonnav'>
     <tr>
     <td>&nbsp;</td>
     <td class='spacefiller'>&nbsp;</td>
     <td>&nbsp;</td>
     <td><button type="submit" name="step2" id="step2" class="btn next">NEXT</button></td>
     </tr>
     </table> 
      </td>
     </tr>
     </table></form>
    </td>
  </tr>
  <?php $this->load->view("addons/public_footer");?>
</table>


</body>
</html>