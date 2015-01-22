
ALTER TABLE `posting` ADD `institution_id` VARCHAR( 100 ) NOT NULL AFTER `postee_id` ;



DROP TABLE IF EXISTS permission;
CREATE TABLE permission (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(200) NOT NULL,
  display varchar(300) NOT NULL,
  details varchar(300) NOT NULL,
  category varchar(200) NOT NULL,
  url varchar(300) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (id),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO permission (id, code, display, details, category, url, status) VALUES
(1, 'view_relevant_jobs', 'Relevant Jobs', '', 'job_notices', 'vacancy/relevant_list', 'active'),
(2, 'apply_for_job', 'Apply for a Job', '', 'job_notices', 'vacancy/apply', 'active'),
(3, 'view_my_saved_jobs', 'My Saved Jobs', '', 'job_notices', 'vacancy/saved', 'active'),
(4, 'view_job_application_status', 'Job Application Status', '', 'job_notices', 'vacancy/status', 'active'),
(5, 'add_new_job', 'New Job', '', 'job_notices', 'vacancy/add', 'active'),
(6, 'set_vacancy_shortlist', 'New Job Shortlist', '', 'interviews', 'vacancy/shortlist', 'active'),
(7, 'set_interview_date', 'Set Interview Date', '', 'interviews', 'interview/set_date', 'active'),
(8, 'cancel_interview', 'Cancel Interview', '', 'interviews', 'interview/cancel', 'active'),
(9, 'submit_recommendation_for_job', 'Submit Recommendation', '', 'interviews', 'interview/submit_recommendation', 'active'),
(10, 'view_recommendation_list', 'View Recommendations', 'Teacher or Manager only views their application recommendations', 'interviews', 'interview/view_recommendations', 'active'),
(11, 'add_interview_results', 'Add Interview Results', 'May include setting a date for the next interview OR marking this as final interview', 'interviews', 'interview/add_results', 'active'),
(12, 'view_interview_results', 'View Interview Results', '', 'interviews', 'interview/view_results', 'active'),
(13, 'publish_job_notices', 'Publish Jobs', '', 'approvals', 'vacancy/lists/action/publish', 'active'),
(14, 'verify_job_notices', 'Verify Jobs', '', 'approvals', 'vacancy/lists/action/verify', 'active'),
(15, 'archive_job_notices', 'Archive Jobs', '', 'approvals', 'vacancy/lists/action/archive', 'active'),
(16, 'view_teacher_applications', 'View Teacher Applications', '', 'approvals', 'register/applications/action/view', 'active'),
(17, 'verify_teacher_application_at_hr_level', 'HR Teacher Application Verification', '', 'approvals', 'register/applications/action/verify/level/hr', 'active'),
(18, 'verify_teacher_application_at_instructor_level', 'Instructor Teacher Application Verification', '', 'approvals', 'register/applications/action/verify/level/instructor', 'active'),
(19, 'view_user_applications', 'View User Applications', '', 'approvals', 'user/applications/action/view', 'active'),
(20, 'verify_user_applications', 'Verify User Applications', '', 'approvals', 'user/applications/action/verify', 'active'),
(21, 'view_school_data_changes', 'View School Changes', '', 'approvals', 'data/schools/action/view', 'active'),
(22, 'verify_school_data_updates', 'Verify School Changes', '', 'approvals', 'data/schools/action/verify', 'active'),
(23, 'view_teacher_data_changes', 'View Teacher Changes', '', 'approvals', 'data/teachers/action/view', 'active'),
(24, 'verify_teacher_data_changes', 'Verify Teacher Changes', '', 'approvals', 'data/teachers/action/verify', 'active'),
(25, 'verify_permission_change_requests', 'Verify Permission Changes', '', 'approvals', 'permission/changes/action/verify', 'active'),
(26, 'view_data_secrecy_applications', 'View Secrecy Applications', '', 'approvals', 'data/secrecy_applications/action/view', 'active'),
(27, 'verify_data_secrecy_applications', 'Verify Secrecy Applications', '', 'approvals', 'data/secrecy_applications/action/verify', 'active'),
(28, 'view_job_confirmation_applications', 'View Confirmation Applications', 'cao users only see applications for their county.', 'approvals', 'job/confirmation_applications', 'active'),
(29, 'issue_job_confirmation_letter', 'Issue Job Confirmation', '', 'approvals', 'job/confirmation_letter/action/issue', 'active'),
(30, 'verify_job_confirmation_letter', 'Verify Job Confirmation', '', 'approvals', 'job/confirmation_letter/action/verify', 'active'),
(31, 'post_to_new_position', 'Post to New Job', '', 'approvals', 'job/post', 'active'),
(32, 'view_transfer_applications', 'View Transfer Applications', 'manager only views applications for their institution', 'approvals', 'transfer/lists', 'active'),
(33, 'cancel_transfer_application', 'Cancel Transfer Application', 'teacher,manager users can only cancel their own applications', 'approvals', 'transfer/cancel', 'active'),
(34, 'verify_transfer_at_institution_level', 'Institution Transfer Verification', '', 'approvals', 'transfer/verify/level/institution', 'active'),
(35, 'verify_transfer_at_county_level', 'County Transfer Verification', '', 'approvals', 'transfer/verify/level/county', 'active'),
(36, 'submit_transfer_pca', 'Submit Transfer PCA', '', 'approvals', 'transfer/submit_pca', 'active'),
(37, 'verify_transfer_at_ministry_level', 'Ministry Transfer Verification', '', 'approvals', 'transfer/verify/level/ministry', 'active'),
(38, 'view_leave_applications', 'View Leave Applications', '', 'approvals', 'leave/lists', 'active'),
(39, 'cancel_leave_application', 'Cancel Leave Application', '', 'approvals', 'leave/cancel', 'active'),
(40, 'verify_leave_at_county_level', 'County Leave Verification', '', 'approvals', 'leave/verify/level/county', 'active'),
(41, 'verify_leave_at_ministry_level', 'Ministry Leave Verification', '', 'approvals', 'leave/verify/level/ministry', 'active'),
(42, 'prepare_leave_verification_letter', 'Send Leave Letter', '', 'approvals', 'leave/send_letter', 'active'),
(43, 'view_retirement_applications', 'View Retirement Applications', '', 'approvals', 'retirement/application_list', 'active'),
(44, 'cancel_retirement_application', 'Cancel Retirement Application', '', 'approvals', 'retirement/cancel', 'active'),
(45, 'verify_retirement_application', 'Verify Retirement Application', '', 'approvals', 'retirement/verify', 'active'),
(46, 'verify_teacher_census_submissions', 'Verify Teacher Census', '', 'approvals', 'data/teacher_census/action/verify', 'active'),
(47, 'view_teacher_census_report', 'View Teacher Census', '', 'approvals', 'data/teacher_census/action/view', 'active'),
(48, 'complete_teacher_application', 'Complete My Teacher Application', '', 'forms', 'register/step_one', 'active'),
(49, 'update_my_teacher_profile', 'Update My Teacher Profile', '', 'forms', 'profile/teacher_data', 'active'),
(50, 'apply_for_leave', 'Apply For Leave', '', 'forms', 'leave/apply', 'active'),
(51, 'apply_for_transfer', 'Apply For Transfer', '', 'forms', 'transfer/apply', 'active'),
(52, 'request_job_confirmation', 'Request Job Confirmation', '', 'forms', 'job/request_confirmation', 'active'),
(53, 'apply_for_promotion', 'Apply For Promotion', '', 'forms', 'job/apply_for_promotion', 'active'),
(54, 'apply_to_retire', 'Apply To Retire', '', 'forms', 'retirement/apply', 'active'),
(55, 'request_data_secrecy', 'Apply For Secrecy', '', 'forms', 'data/apply_for_secrecy', 'active'),
(56, 'add_new_teacher', 'New Teacher', '', 'forms', 'data/new_teacher', 'active'),
(57, 'submit_teacher_census_data', 'Teacher Census', '', 'forms', 'data/new_teacher_census', 'active'),
(58, 'add_new_school', 'New School', '', 'forms', 'data/new_school', 'active'),
(59, 'add_new_user', 'New User', '', 'users', 'user/add_new', 'active'),
(60, 'set_user_permissions', 'Set User Permissions', '', 'users', 'user/set_permissions', 'active'),
(61, 'change_user_status', 'Update User Status', '', 'users', 'user/update_status', 'active'),
(62, 'change_other_user_passwords', 'Update User Password', '', 'users', 'user/change_password', 'active'),
(63, 'send_system_message', 'New Message', '', 'my_messages', 'message/send_new_system', 'active'),
(64, 'send_email_message', 'New Email', '', 'my_messages', 'message/send_new_email', 'active'),
(65, 'send_sms_message', 'New SMS', '', 'my_messages', 'message/send_new_sms', 'active'),
(66, 'view_message_inbox', 'Inbox', '', 'my_messages', 'message/inbox', 'active'),
(67, 'view_archived_messages', 'Archived Messages', '', 'my_messages', 'message/archive', 'active'),
(68, 'view_sent_messages', 'Sent Messages', '', 'my_messages', 'message/sent', 'active'),
(69, 'view_permission_list', 'Permissions', '', 'permissions', 'permission/lists', 'active'),
(70, 'view_permission_group_list', 'Permission Groups', '', 'permissions', 'permission/group_list', 'active'),
(71, 'view_user_permissions', 'User Permissions', '', 'permissions', 'permission/user_list', 'active'),
(72, 'add_new_permission_group', 'New Permission Group', '', 'permissions', 'permission/add_group', 'active'),
(73, 'change_group_permissions', 'Update Permissions', '', 'permissions', 'permission/update_group', 'active'),
(74, 'view_user_log', 'User Activity Log', '', 'reports', 'report/logs/type/user', 'active'),
(75, 'view_system_log', 'System Log', '', 'reports', 'report/logs/type/system', 'active'),
(76, 'view_users', 'Users', '', 'reports', 'report/users', 'active'),
(77, 'view_schools', 'Schools', '', 'reports', 'report/schools', 'active'),
(78, 'view_teachers', 'Teachers', '', 'reports', 'report/teachers', 'active'),
(79, 'view_job_applications', 'Job Applications', '', 'reports', 'report/job_applications', 'active'),
(80, 'view_jobs', 'Jobs', '', 'reports', 'report/jobs', 'active'),
(81, 'view_retirements', 'Retirements', 'Manager only sees retirements at their school. Deo only sees retirements in their district', 'reports', 'report/retirements', 'active'),
(82, 'view_current_job', 'Current Job', '', 'job_description', 'job/view_current', 'active'),
(83, 'view_previous_jobs', 'Previous Jobs', '', 'job_description', 'job/view_previous', 'active'),
(84, 'view_current_school', 'Current School', '', 'school_profile', 'school/view_current', 'active'),
(85, 'view_previous_schools', 'Previous Schools', '', 'school_profile', 'school/view_previous', 'active'),
(86, 'log_out', 'Log Out', '', 'log_out', 'account/logout', 'active');

DROP TABLE IF EXISTS permission_group;
CREATE TABLE permission_group (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  notes text NOT NULL,
  default_permission varchar(100) NOT NULL,
  is_removable enum('Y','N') NOT NULL DEFAULT 'Y',
  is_system_only enum('Y','N') NOT NULL DEFAULT 'N',
  date_added datetime NOT NULL,
  added_by varchar(100) NOT NULL,
  last_updated datetime NOT NULL,
  last_updated_by varchar(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO permission_group (id, name, notes, default_permission, is_removable, is_system_only, date_added, added_by, last_updated, last_updated_by) VALUES
(1, 'applicant', 'Teacher Applicant', '48', 'N', 'Y', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(2, 'teacher', 'Teacher', '1', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(3, 'manager', 'Institution Manager', '57', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(4, 'admin', 'Administrator', '66', 'N', 'Y', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(5, 'moes', 'Ministry of Education and Sports', '78', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(6, 'deo', 'District Education Officer', '78', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(7, 'esc', 'Education Service Commission', '80', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(8, 'dsc', 'District Service Commission', '12', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(9, 'mops', 'Ministry of Public Service', '80', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(10, 'hr', 'Human Resource', '79', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(11, 'tiet', 'Teacher Instruction Education and Training', '18', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(12, 'cao', 'County Administrative Officer', '47', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', ''),
(13, 'psc', 'Public Service Commission', '37', 'N', 'N', '2015-01-01 00:00:00', '1', '0000-00-00 00:00:00', '');

DROP TABLE IF EXISTS permission_group_mapping;
CREATE TABLE permission_group_mapping (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  group_id varchar(100) NOT NULL,
  permission_id varchar(100) NOT NULL,
  date_added datetime NOT NULL,
  added_by varchar(100) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO permission_group_mapping (id, group_id, permission_id, date_added, added_by) VALUES
(1, '2', '1', '2015-01-20 09:46:09', ''),
(2, '3', '1', '2015-01-20 09:46:09', ''),
(4, '2', '2', '2015-01-20 09:46:09', ''),
(5, '3', '2', '2015-01-20 09:46:09', ''),
(7, '2', '3', '2015-01-20 09:46:09', ''),
(8, '3', '3', '2015-01-20 09:46:09', ''),
(10, '2', '4', '2015-01-20 09:46:09', ''),
(11, '3', '4', '2015-01-20 09:46:09', ''),
(13, '4', '5', '2015-01-20 09:46:09', ''),
(14, '5', '5', '2015-01-20 09:46:09', ''),
(15, '6', '5', '2015-01-20 09:46:09', ''),
(16, '7', '6', '2015-01-20 09:46:09', ''),
(17, '8', '6', '2015-01-20 09:46:09', ''),
(19, '7', '7', '2015-01-20 09:46:10', ''),
(20, '8', '7', '2015-01-20 09:46:10', ''),
(22, '2', '8', '2015-01-20 09:46:10', ''),
(23, '3', '8', '2015-01-20 09:46:10', ''),
(24, '7', '8', '2015-01-20 09:46:10', ''),
(25, '8', '8', '2015-01-20 09:46:10', ''),
(29, '3', '9', '2015-01-20 09:46:10', ''),
(30, '2', '10', '2015-01-20 09:46:10', ''),
(31, '3', '10', '2015-01-20 09:46:10', ''),
(32, '4', '10', '2015-01-20 09:46:10', ''),
(33, '7', '10', '2015-01-20 09:46:10', ''),
(34, '8', '10', '2015-01-20 09:46:10', ''),
(37, '7', '11', '2015-01-20 09:46:10', ''),
(38, '8', '11', '2015-01-20 09:46:10', ''),
(40, '4', '12', '2015-01-20 09:46:10', ''),
(41, '7', '12', '2015-01-20 09:46:10', ''),
(42, '8', '12', '2015-01-20 09:46:10', ''),
(43, '4', '13', '2015-01-20 09:46:10', ''),
(44, '7', '13', '2015-01-20 09:46:10', ''),
(46, '9', '14', '2015-01-20 09:46:10', ''),
(47, '4', '15', '2015-01-20 09:46:10', ''),
(48, '5', '15', '2015-01-20 09:46:10', ''),
(49, '6', '15', '2015-01-20 09:46:10', ''),
(50, '4', '16', '2015-01-20 09:46:10', ''),
(51, '10', '16', '2015-01-20 09:46:10', ''),
(53, '10', '17', '2015-01-20 09:46:10', ''),
(54, '11', '18', '2015-01-20 09:46:10', ''),
(55, '4', '19', '2015-01-20 09:46:10', ''),
(56, '4', '20', '2015-01-20 09:46:10', ''),
(57, '4', '21', '2015-01-20 09:46:10', ''),
(58, '4', '22', '2015-01-20 09:46:10', ''),
(59, '4', '23', '2015-01-20 09:46:10', ''),
(60, '4', '24', '2015-01-20 09:46:10', ''),
(61, '4', '25', '2015-01-20 09:46:10', ''),
(62, '4', '26', '2015-01-20 09:46:10', ''),
(63, '7', '26', '2015-01-20 09:46:10', ''),
(64, '8', '26', '2015-01-20 09:46:10', ''),
(65, '7', '27', '2015-01-20 09:46:10', ''),
(66, '8', '27', '2015-01-20 09:46:10', ''),
(68, '4', '28', '2015-01-20 09:46:10', ''),
(69, '5', '28', '2015-01-20 09:46:10', ''),
(70, '12', '28', '2015-01-20 09:46:10', ''),
(71, '5', '29', '2015-01-20 09:46:11', ''),
(72, '12', '29', '2015-01-20 09:46:11', ''),
(74, '7', '30', '2015-01-20 09:46:11', ''),
(75, '8', '30', '2015-01-20 09:46:11', ''),
(77, '5', '31', '2015-01-20 09:46:11', ''),
(78, '12', '31', '2015-01-20 09:46:11', ''),
(80, '3', '32', '2015-01-20 09:46:11', ''),
(81, '4', '32', '2015-01-20 09:46:11', ''),
(83, '2', '33', '2015-01-20 09:46:11', ''),
(84, '3', '33', '2015-01-20 09:46:11', ''),
(86, '3', '34', '2015-01-20 09:46:11', ''),
(87, '5', '35', '2015-01-20 09:46:11', ''),
(88, '12', '35', '2015-01-20 09:46:11', ''),
(90, '3', '36', '2015-01-20 09:46:11', ''),
(91, '13', '37', '2015-01-20 09:46:11', ''),
(92, '4', '38', '2015-01-20 09:46:11', ''),
(93, '2', '39', '2015-01-20 09:46:11', ''),
(94, '3', '39', '2015-01-20 09:46:11', ''),
(96, '5', '40', '2015-01-20 09:46:11', ''),
(97, '12', '40', '2015-01-20 09:46:11', ''),
(99, '7', '41', '2015-01-20 09:46:11', ''),
(100, '8', '41', '2015-01-20 09:46:11', ''),
(102, '5', '42', '2015-01-20 09:46:11', ''),
(103, '12', '42', '2015-01-20 09:46:11', ''),
(105, '4', '43', '2015-01-20 09:46:11', ''),
(106, '2', '44', '2015-01-20 09:46:11', ''),
(107, '3', '44', '2015-01-20 09:46:11', ''),
(109, '3', '45', '2015-01-20 09:46:11', ''),
(110, '5', '46', '2015-01-20 09:46:11', ''),
(111, '12', '46', '2015-01-20 09:46:11', ''),
(113, '4', '47', '2015-01-20 09:46:11', ''),
(114, '5', '47', '2015-01-20 09:46:11', ''),
(115, '12', '47', '2015-01-20 09:46:11', ''),
(116, '1', '48', '2015-01-20 09:46:11', ''),
(117, '2', '49', '2015-01-20 09:46:11', ''),
(118, '2', '50', '2015-01-20 09:46:11', ''),
(119, '3', '50', '2015-01-20 09:46:11', ''),
(121, '2', '51', '2015-01-20 09:46:11', ''),
(122, '3', '51', '2015-01-20 09:46:11', ''),
(124, '2', '52', '2015-01-20 09:46:11', ''),
(125, '3', '52', '2015-01-20 09:46:11', ''),
(127, '2', '53', '2015-01-20 09:46:11', ''),
(128, '3', '53', '2015-01-20 09:46:11', ''),
(130, '2', '54', '2015-01-20 09:46:11', ''),
(131, '3', '54', '2015-01-20 09:46:11', ''),
(133, '2', '55', '2015-01-20 09:46:11', ''),
(134, '4', '56', '2015-01-20 09:46:11', ''),
(135, '10', '56', '2015-01-20 09:46:11', ''),
(137, '3', '57', '2015-01-20 09:46:11', ''),
(138, '4', '57', '2015-01-20 09:46:11', ''),
(140, '4', '58', '2015-01-20 09:46:12', ''),
(141, '4', '59', '2015-01-20 09:46:12', ''),
(142, '4', '60', '2015-01-20 09:46:12', ''),
(143, '4', '61', '2015-01-20 09:46:12', ''),
(144, '4', '62', '2015-01-20 09:46:12', ''),
(145, '1', '63', '2015-01-20 09:46:12', ''),
(146, '2', '63', '2015-01-20 09:46:12', ''),
(147, '3', '63', '2015-01-20 09:46:12', ''),
(148, '4', '63', '2015-01-20 09:46:12', ''),
(149, '5', '63', '2015-01-20 09:46:12', ''),
(150, '6', '63', '2015-01-20 09:46:12', ''),
(151, '7', '63', '2015-01-20 09:46:12', ''),
(152, '8', '63', '2015-01-20 09:46:12', ''),
(153, '9', '63', '2015-01-20 09:46:12', ''),
(154, '10', '63', '2015-01-20 09:46:12', ''),
(155, '11', '63', '2015-01-20 09:46:12', ''),
(156, '12', '63', '2015-01-20 09:46:12', ''),
(157, '13', '63', '2015-01-20 09:46:12', ''),
(160, '4', '64', '2015-01-20 09:46:12', ''),
(161, '4', '65', '2015-01-20 09:46:12', ''),
(162, '1', '66', '2015-01-20 09:46:12', ''),
(163, '2', '66', '2015-01-20 09:46:12', ''),
(164, '3', '66', '2015-01-20 09:46:12', ''),
(165, '4', '66', '2015-01-20 09:46:12', ''),
(166, '5', '66', '2015-01-20 09:46:12', ''),
(167, '6', '66', '2015-01-20 09:46:12', ''),
(168, '7', '66', '2015-01-20 09:46:12', ''),
(169, '8', '66', '2015-01-20 09:46:12', ''),
(170, '9', '66', '2015-01-20 09:46:12', ''),
(171, '10', '66', '2015-01-20 09:46:12', ''),
(172, '11', '66', '2015-01-20 09:46:12', ''),
(173, '12', '66', '2015-01-20 09:46:12', ''),
(174, '13', '66', '2015-01-20 09:46:12', ''),
(177, '1', '67', '2015-01-20 09:46:12', ''),
(178, '2', '67', '2015-01-20 09:46:12', ''),
(179, '3', '67', '2015-01-20 09:46:12', ''),
(180, '4', '67', '2015-01-20 09:46:12', ''),
(181, '5', '67', '2015-01-20 09:46:12', ''),
(182, '6', '67', '2015-01-20 09:46:12', ''),
(183, '7', '67', '2015-01-20 09:46:12', ''),
(184, '8', '67', '2015-01-20 09:46:12', ''),
(185, '9', '67', '2015-01-20 09:46:12', ''),
(186, '10', '67', '2015-01-20 09:46:12', ''),
(187, '11', '67', '2015-01-20 09:46:12', ''),
(188, '12', '67', '2015-01-20 09:46:12', ''),
(189, '13', '67', '2015-01-20 09:46:12', ''),
(192, '1', '68', '2015-01-20 09:46:12', ''),
(193, '2', '68', '2015-01-20 09:46:12', ''),
(194, '3', '68', '2015-01-20 09:46:12', ''),
(195, '4', '68', '2015-01-20 09:46:12', ''),
(196, '5', '68', '2015-01-20 09:46:12', ''),
(197, '6', '68', '2015-01-20 09:46:12', ''),
(198, '7', '68', '2015-01-20 09:46:12', ''),
(199, '8', '68', '2015-01-20 09:46:12', ''),
(200, '9', '68', '2015-01-20 09:46:12', ''),
(201, '10', '68', '2015-01-20 09:46:12', ''),
(202, '11', '68', '2015-01-20 09:46:12', ''),
(203, '12', '68', '2015-01-20 09:46:12', ''),
(204, '13', '68', '2015-01-20 09:46:12', ''),
(207, '4', '69', '2015-01-20 09:46:12', ''),
(208, '4', '70', '2015-01-20 09:46:12', ''),
(209, '4', '71', '2015-01-20 09:46:12', ''),
(210, '4', '72', '2015-01-20 09:46:12', ''),
(211, '4', '73', '2015-01-20 09:46:12', ''),
(212, '4', '74', '2015-01-20 09:46:12', ''),
(213, '4', '75', '2015-01-20 09:46:12', ''),
(214, '4', '76', '2015-01-20 09:46:12', ''),
(215, '4', '77', '2015-01-20 09:46:12', ''),
(216, '5', '77', '2015-01-20 09:46:12', ''),
(217, '6', '77', '2015-01-20 09:46:12', ''),
(218, '4', '78', '2015-01-20 09:46:12', ''),
(219, '5', '78', '2015-01-20 09:46:12', ''),
(220, '6', '78', '2015-01-20 09:46:12', ''),
(221, '4', '79', '2015-01-20 09:46:12', ''),
(222, '10', '79', '2015-01-20 09:46:12', ''),
(224, '4', '80', '2015-01-20 09:46:12', ''),
(225, '5', '80', '2015-01-20 09:46:12', ''),
(226, '6', '80', '2015-01-20 09:46:12', ''),
(227, '7', '80', '2015-01-20 09:46:12', ''),
(228, '9', '80', '2015-01-20 09:46:12', ''),
(229, '10', '80', '2015-01-20 09:46:12', ''),
(231, '3', '81', '2015-01-20 09:46:12', ''),
(232, '4', '81', '2015-01-20 09:46:12', ''),
(233, '5', '81', '2015-01-20 09:46:12', ''),
(234, '6', '81', '2015-01-20 09:46:12', ''),
(238, '2', '82', '2015-01-20 09:46:12', ''),
(239, '3', '82', '2015-01-20 09:46:12', ''),
(241, '2', '83', '2015-01-20 09:46:12', ''),
(242, '3', '83', '2015-01-20 09:46:12', ''),
(244, '2', '84', '2015-01-20 09:46:12', ''),
(245, '3', '84', '2015-01-20 09:46:12', ''),
(247, '2', '85', '2015-01-20 09:46:12', ''),
(248, '3', '85', '2015-01-20 09:46:12', ''),
(250, '1', '86', '2015-01-20 09:46:12', ''),
(251, '2', '86', '2015-01-20 09:46:12', ''),
(252, '3', '86', '2015-01-20 09:46:12', ''),
(253, '4', '86', '2015-01-20 09:46:12', ''),
(254, '5', '86', '2015-01-20 09:46:12', ''),
(255, '6', '86', '2015-01-20 09:46:12', ''),
(256, '7', '86', '2015-01-20 09:46:12', ''),
(257, '8', '86', '2015-01-20 09:46:12', ''),
(258, '9', '86', '2015-01-20 09:46:12', ''),
(259, '10', '86', '2015-01-20 09:46:12', ''),
(260, '11', '86', '2015-01-20 09:46:12', ''),
(261, '12', '86', '2015-01-20 09:46:12', ''),
(262, '13', '86', '2015-01-20 09:46:12', '');

DROP TABLE IF EXISTS query;
CREATE TABLE `query` (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(300) NOT NULL,
  details text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO query (id, code, details) VALUES
(1, 'get_list_of_districts', 'SELECT *, name AS value, name AS display FROM district ORDER BY name'),
(2, 'get_list_of_countries', 'SELECT *, name AS value, name AS display FROM country ORDER BY display_order DESC, name ASC'),
(3, 'add_person_data', 'INSERT INTO person (first_name, last_name, gender, date_of_birth, date_added) VALUES (''_FIRST_NAME_'', ''_LAST_NAME_'', ''_GENDER_'', ''_DATE_OF_BIRTH_'', NOW())'),
(4, 'add_contact_data', 'INSERT INTO contact (contact_type, carrier_id, details, parent_id, parent_type, date_added) VALUES (''_CONTACT_TYPE_'', ''_CARRIER_ID_'', ''_DETAILS_'', ''_PARENT_ID_'', ''_PARENT_TYPE_'', NOW())'),
(5, 'add_new_address', 'INSERT INTO address (parent_id, parent_type, address_type, importance, details, county, district_id, country_id, date_added)\r\n\r\n(SELECT ''_PARENT_ID_'' AS parent_id, \r\n''_PARENT_TYPE_'' AS parent_type, \r\n''_ADDRESS_TYPE_'' AS address_type, \r\n''_IMPORTANCE_'' AS importance, \r\n''_DETAILS_'' AS details, \r\n ''_COUNTY_'' AS county,\r\nIF((SELECT id FROM district WHERE name=''_DISTRICT_'' LIMIT 1) IS NOT NULL, (SELECT id FROM district WHERE name=''_DISTRICT_'' LIMIT 1), ''_DISTRICT_'') AS district_id, \r\nIF((SELECT id FROM country WHERE name=''_COUNTRY_'' LIMIT 1) IS NOT NULL, (SELECT id FROM country WHERE name=''_COUNTRY_'' LIMIT 1), ''_COUNTRY_'') AS country_id,\r\nNOW() AS date_added\r\n)'),
(6, 'add_user_data', 'INSERT INTO user (person_id, 	login_name, login_password, date_added) VALUES (''_PERSON_ID_'', ''_LOGIN_NAME_'', ''_LOGIN_PASSWORD_'', NOW())'),
(7, 'get_message_template', 'SELECT * FROM message WHERE message_type=''_MESSAGE_TYPE_'''),
(8, 'add_event_log', 'INSERT INTO log (log_code, result, details, date_added) VALUES (''_LOG_CODE_'', ''_RESULT_'', ''_DETAILS_'', NOW())'),
(9, 'update_person_profile_part', 'UPDATE person SET _QUERY_PART_ WHERE id=''_PERSON_ID_'''),
(10, 'update_person_citizenship', 'UPDATE person P LEFT JOIN country C ON (C.name=''_CITIZEN_COUNTRY_'') \r\nSET P.citizenship_id=C.id, P.citizenship_type=''_CITIZENSHIP_TYPE_'' WHERE P.id=''_PERSON_ID_'''),
(11, 'add_another_id', 'INSERT INTO other_user_id (parent_id, parent_type, id_type, id_value, date_added) VALUES (''_PARENT_ID_'', ''_PARENT_TYPE_'', ''_ID_TYPE_'', ''_ID_VALUE_'', NOW())'),
(12, 'add_academic_history', 'INSERT INTO academic_history (person_id, institution, start_date, end_date, certificate_name, certificate_number, is_highest, date_added, added_by) VALUES (''_PERSON_ID_'', ''_INSTITUTION_'', ''_START_DATE_'', ''_END_DATE_'', ''_CERTIFICATE_NAME_'', ''_CERTIFICATE_NUMBER_'', ''_IS_HIGHEST_'', NOW(), ''_ADDED_BY_'')'),
(13, 'add_subject_data', 'INSERT INTO subject (details, study_category, parent_id, parent_type) VALUES (''_DETAILS_'', ''_STUDY_CATEGORY_'', ''_PARENT_ID_'', ''_PARENT_TYPE_'')'),
(14, 'remove_academic_history', 'DELETE FROM academic_history WHERE person_id=''_PERSON_ID_'''),
(15, 'remove_subject_data', 'DELETE FROM subject WHERE parent_id=''_PARENT_ID_'' AND parent_type=''_PARENT_TYPE_'''),
(16, 'update_person_data', 'UPDATE person SET first_name=''_FIRST_NAME_'', last_name=''_LAST_NAME_'', gender=''_GENDER_'', date_of_birth=''_DATE_OF_BIRTH_'' WHERE id=''_PERSON_ID_'''),
(17, 'update_contact_data', 'UPDATE contact SET details=''_DETAILS_'', carrier_id=''_CARRIER_ID_''  WHERE contact_type=''_CONTACT_TYPE_'' AND parent_id=''_PARENT_ID_'' AND parent_type=''_PARENT_TYPE_'''),
(18, 'update_address_data', 'UPDATE address SET \r\n\r\ndetails=''_DETAILS_'', \r\n\r\naddress_type=''_ADDRESS_TYPE_'',\r\n \r\ncounty=''_COUNTY_'',\r\n \r\ndistrict_id=(SELECT IF((SELECT id FROM district WHERE name=''_DISTRICT_'' LIMIT 1) IS NOT NULL, (SELECT id FROM district WHERE name=''_DISTRICT_'' LIMIT 1), ''_DISTRICT_'') AS district_id), \r\n\r\ncountry_id=(SELECT IF((SELECT id FROM country WHERE name=''_COUNTRY_'' LIMIT 1) IS NOT NULL, (SELECT id FROM country WHERE name=''_COUNTRY_'' LIMIT 1), ''_COUNTRY_'') AS country_id)\r\n\r\nWHERE parent_id =''_PARENT_ID_'' AND parent_type = ''_PARENT_TYPE_'' AND importance = ''_IMPORTANCE_'''),
(19, 'update_another_id', 'UPDATE other_user_id SET id_value=''_ID_VALUE_'' WHERE parent_id=''_PARENT_ID_'' AND parent_type=''_PARENT_TYPE_'' AND id_type=''_ID_TYPE_'''),
(20, 'record_message_exchange', 'INSERT INTO message_exchange (message_id, send_format, details, category, date_added, sender_id, recipient_id)\r\n\r\n(SELECT id AS message_id, ''_SEND_FORMAT_'' AS send_format, ''_DETAILS_'' AS details, ''_CATEGORY_'' AS category, NOW() AS date_added, ''_SENDER_ID_'' AS sender_id, ''_RECIPIENT_ID_'' AS recipient_id FROM message WHERE message_type=''_CODE_'')'),
(21, 'get_user_by_name_and_pass', 'SELECT U.*, P.first_name, P.last_name, P.gender, P.date_of_birth,\r\n\r\n(SELECT P.code FROM permission_group G LEFT JOIN permission P ON (G.default_permission=P.id) WHERE G.id=U.permission_group_id LIMIT 1) AS default_permission_code,\r\n\r\n(SELECT details FROM contact WHERE contact_type=''email'' AND parent_id=P.id AND parent_type=''person'' AND status=''active'' LIMIT 1) AS email_address,\r\n\r\nIF((SELECT details FROM contact WHERE contact_type=''telephone'' AND parent_id=P.id AND parent_type=''person'' AND status=''active'' LIMIT 1) IS NOT NULL, (SELECT details FROM contact WHERE contact_type=''telephone'' AND parent_id=P.id AND parent_type=''person'' AND status=''active'' LIMIT 1), '''') AS telephone \r\n\r\nFROM user U LEFT JOIN person P ON (U.person_id=P.id) \r\nWHERE login_name=''_LOGIN_NAME_'' AND login_password=''_LOGIN_PASSWORD_'' AND status=''active'''),
(22, 'get_user_by_email', 'SELECT U.id AS user_id, P.first_name, P.last_name \r\nFROM contact C LEFT JOIN person P ON (C.parent_id=P.id AND C.contact_type=''email'' AND C.parent_type=''person'') LEFT JOIN user U ON (U.person_id=P.id) \r\nWHERE C.details=''_EMAIL_ADDRESS_'''),
(23, 'get_group_permissions', 'SELECT P.code \r\nFROM permission_group_mapping M LEFT JOIN permission P ON (M.permission_id=P.id) \r\nWHERE M.group_id=''_GROUP_ID_'''),
(24, 'activate_teacher_applicant_user', 'UPDATE user SET status=''active'', last_updated=NOW(), permission_group_id=(SELECT id FROM permission_group WHERE name=''applicant'' LIMIT 1) WHERE person_id=''_PERSON_ID_'' AND permission_group_id='''''),
(25, 'get_user_by_id', 'SELECT *, id AS user_id FROM user WHERE id=''_USER_ID_'''),
(26, 'get_group_by_id', 'SELECT * FROM permission_group WHERE id=''_GROUP_ID_'''),
(27, 'get_group_default_permission', 'SELECT P.code, P.url AS page FROM permission_group G LEFT JOIN permission P ON (G.default_permission=P.id) WHERE G.id = ''_GROUP_ID_'' LIMIT 1'),
(28, 'get_permission_by_code', 'SELECT * FROM permission WHERE code=''_CODE_'''),
(29, 'get_permission_details', 'SELECT * FROM permission WHERE code IN (_PERMISSIONS_) AND status=''active'''),
(30, 'get_user_profile', 'SELECT U.id AS user_id, U.person_id, U.login_name, U.date_added, P.first_name, P.last_name,\r\n\r\n(SELECT notes FROM permission_group WHERE id=U.permission_group_id LIMIT 1) AS user_role, \r\n \r\n(SELECT details FROM contact WHERE parent_id=U.person_id AND parent_type=''person'' AND contact_type=''email'' AND status=''active'' LIMIT 1) AS email_address, \r\n\r\n(SELECT details FROM contact WHERE parent_id=U.person_id AND parent_type=''person'' AND contact_type=''telephone'' AND status=''active'' LIMIT 1) AS telephone \r\n\r\nFROM user U LEFT JOIN person P ON (P.id=U.person_id) \r\nWHERE U.id=''_USER_ID_'''),
(31, 'update_user_password', 'UPDATE user SET login_password=''_NEW_PASSWORD_'', previous_password=''_OLD_PASSWORD_'', last_updated=NOW(), last_updated_by=''_UPDATED_BY_'' WHERE id=''_USER_ID_'''),
(32, 'get_list_of_institutions', 'SELECT *, name AS value, name AS display FROM institution WHERE _SEARCH_QUERY_ ORDER BY name'),
(33, 'get_permission_groups', 'SELECT *, notes AS value, notes AS display FROM permission_group WHERE is_system_only IN (_SYSTEM_ONLY_) ORDER BY notes'),
(34, 'add_vacancy_data', 'INSERT INTO vacancy (school_id, start_date, end_date, topic, summary, details, role_id, date_added, added_by)\r\n\r\n(SELECT \r\n(SELECT id FROM institution WHERE name=''_INSTITUTION_'' LIMIT 1) AS school_id, \r\n\r\n''_START_DATE_'' AS start_date, ''_END_DATE_'' AS end_date, ''_TOPIC_'' AS topic, ''_SUMMARY_'' AS summary, ''_DETAILS_'', \r\n\r\n(SELECT id FROM permission_group WHERE notes=''_ROLE_'' LIMIT 1) AS role_id, \r\n\r\nNOW() AS date_added, ''_ADDED_BY_'' AS added_by\r\n)'),
(35, 'update_vacancy_data', 'UPDATE vacancy SET topic=''_TOPIC_'', summary=''_SUMMARY_'', details=''_DETAILS_'', start_date=''_START_DATE_'', end_date=''_END_DATE_'' WHERE id=''_VACANCY_ID_'''),
(36, 'get_vacancy_list_data', 'SELECT V.id, V.start_date, V.end_date, V.topic, V.summary, V.status, I.name AS institution_name, G.notes AS role_name \r\nFROM vacancy V LEFT JOIN institution I ON (V.school_id=I.id) LEFT JOIN permission_group G ON (V.role_id=G.id) \r\nWHERE _SEARCH_QUERY_ ORDER BY V.end_date ASC LIMIT _LIMIT_TEXT_;');



ALTER TABLE institution ADD FULLTEXT(name);

DROP TABLE role;



