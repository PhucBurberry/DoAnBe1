NTEGER NOT NULL,  had_user_activation INTEGER NOT NULL,  was_foreground INTEGER NOT NULL,  had_focus INTEGER NOT NULL) CREATE UNIQUE INDEX setting_origin_start_time ON uses(origin, content_setting_type,usage_start_time) CREATE INDEX setting_origin_end_time ON uses(origin, content_setting_type,usage_end_time) CREATE INDEX start_time ON uses(usage_start_time) CREATE INDEX end_time ON uses(usage_end_time) ..\..\components\permissions\permission_auditing_database.cc DELETE FROM uses WHERE usage_start_time BETWEEN ? AND ? OR usage_end_time BETWEEN ? AND ? ..\..\components\permissions\permission_auditing_service.cc ~PermissionAuditingService StartPeriodicCullingOfExpiredSessions ExpireOldSessions     PermissionsKillSwitch   blocked %s permission has been blocked. %s permission has been blocked as the user has dismissed the permission prompt several times. This can be reset in Page Info which can be accessed by clicking the lock icon next to the URL. See https://permanently-removed.invalid/features/6443143280984064 for more information.           %s permission has been blocked as the user has ignored the permission prompt several times. This can be reset in Page Info which can be accessed by clicking the lock icon next to the URL. See https://permanently-removed.invalid/features/6443143280984064 for more information.             %s permission has been blocked because of a permissions policy applied to the current document. See https://permanently-removed.invalid/EuHzyv for more details.        %s permission has been blocked as the prompt has already been displayed to the user recently.       ��K��K���K�^�K���K�Q�K���K���K�k�K�dismiss_count   ignore_count    dismiss_count_quiet_ui  ignore_count_quiet_ui   dismissal_embargo_days  ignore_embargo_days     display_embargo_minutes FederatedIdentityApi FederatedIdentityAutoReauthn FileSystemAccessRestorePermission AutoPictureInPicture SubAppInstallationPrompts       H'�    `�    ��Ќ    ��C3  б��   ���   �O�    ���   d���   ���   (���   H���   true    ����������������������������������������������������������������������������������������0_1 2_3 4_5 6_10 11_20 GT20 false   mL�	L��L��L��L�HL��  �����������������������������  ������  ��  ��  ��  ��  ��  �  �  ��  ��  ��  �  ��  �  �  �����������������������������  �  ��  ��  ��  ��  ��  ��  ��  �����������������������������  ������  ��  ��  ��   �  �  �  �����������������������������  �  ��  ������  ��  ������  �  ������  ������  �  �����  �  ����������������������������tWL�mWL�JWL�_WL�<WL��WL��VL�XWL�.WL�QWL��WL�5WL�fWL��WL�CWL��WL�~WL��WL��WL��WL��WL��VL��WL��WL�%d,%d,%lld          Chrome is blocking notification permission requests on this site because the site tends to show permission requests that mislead, trick, or force users into allowing notifications. You should fix the issues as soon as possible and submit your site for another review. Learn more at https://permanently-removed.invalid/webtools/answer/9799048.          Chrome might start blocking notification permission requests on this site in the future because the site tends to show permission requests that mislead, trick, or force users into allowing notifications. You should fix the issues as soon as possible and submit your site for another review. Learn more at https://permanently-removed.invalid/webtools/answer/9799048.   Chrome is blocking notification permission requests on this site because the site tends to show notifications with content that mislead or trick users. You should fix the issues as soon as possible and submit your site for another review. Learn more at https://support.google.com/webtools/answer/9799048 Chrome might start blocking notification permission requests on this site in the future because the site tends to show notifications with content that mislead or trick users. You should fix the issues as soon as possible and submit your site for another review. Learn more at https://support.google.com/webtools/answer/9799048 PermissionBubbleRequest PermissionBubbleRequestQueued PermissionBubbleIFrameRequestQueued ..\..\components\permissions\permission_request_manager.cc PreIgnoreQuietPrompt ScheduleDequeueRequestIfNeeded Chrome is blocking notification permission requests on this site because the site exhibits behaviors that may be disruptive to users. Notifications.Quiet.PermissionRequestShown                                1L�EL�_L�RL�8L�    Permissions.Prompt.Shown        Permissions.Prompt.Shown.Gesture        Permissions.Prompt.Shown.NoGesture      Permissions.Prompt.Accepted     Permissions.Prompt.Accepted.Gesture     Permissions.Prompt.Accepted.NoGesture   Permissions.Prompt.AcceptedOnce Permissions.Prompt.AcceptedOnce.Gesture Permissions.Prompt.AcceptedOnce.NoGesture       Permissions.Prompt.Denied       Permissions.Prompt.Denied.Gesture       Permissions.Prompt.Denied.NoGesture     Permissions.Exper