<?php
/**
 * Logs events on the system.
 *
 * @author Al Zziwa <azziwa@gmail.com>
 * @version 1.1.0
 * @copyright TMIS
 * @created 01/08/2015
 */
class Logger extends CI_Model
{
	
	# STUB: Add an event
	function add_event($eventDetails)
	{
		return $this->query_reader->run('add_event_log', array('log_code'=>$eventDetails['log_code'], 'result'=>$eventDetails['result'], 'details'=>$eventDetails['details']."url=".uri_string()."|ipaddress=".$this->input->ip_address()."|browser=".$this->agent->browser()."--".$this->agent->version()."--".$this->agent->platform()));
	}
		
		
		
	# STUB: Generate a log list
	function generate_log_list($listParameters)
	{
		$list = array();
		
		
		return $list;
	}	
	
}


?>