<?php

// Init application
include_once(dirname(dirname(__FILE__)) . '/cc-core/config/admin.bootstrap.php');

// Verify if user is logged in
$userService = new UserService();
$adminUser = $userService->loginCheck();
Functions::RedirectIf($adminUser, HOST . '/login/');
Functions::RedirectIf($userService->checkPermissions('admin_panel', $adminUser), HOST . '/myaccount/');

// Establish page variables, objects, arrays, etc
$page_title = 'CumulusClips Admin Panel - Dashboard';
$first_run = null;

// Execute post install / first run operations
if (isset ($_GET['first_run']) && file_exists (DOC_ROOT . '/cc-install')) {
    Settings::Set ('version', CURRENT_VERSION);
    Filesystem::delete(DOC_ROOT . '/cc-install');
    $first_run = true;
}

// Retrieve news from mothership
if (isset ($_POST['news'])) {
    $curl_handle = curl_init();
    curl_setopt ($curl_handle, CURLOPT_URL, MOTHERSHIP_URL . '/news/');
    curl_setopt ($curl_handle, CURLOPT_RETURNTRANSFER, true);
    curl_setopt ($curl_handle, CURLOPT_FOLLOWLOCATION, true);
    $news = curl_exec ($curl_handle);
    curl_close ($curl_handle);
    $news = (!empty ($news)) ? $news : '<strong>Nothing to report.</strong>';
    exit ($news);
}

// Retrieve Video totals
$result_videos = $db->fetchRow("SELECT COUNT(video_id) as count FROM " . DB_PREFIX . "videos WHERE status = 'approved'");
$videos = $result_videos['count'];

// Retrieve User totals
$result_users = $db->fetchRow("SELECT COUNT(user_id) as count FROM " . DB_PREFIX . "users WHERE status = 'active'");
$members = $result_users['count'];

// Retrieve Comment totals
$result_comments = $db->fetchRow("SELECT COUNT(comment_id) as count FROM " . DB_PREFIX . "comments WHERE status = 'approved'");
$comments = $result_comments['count'];

// Retrieve Rating totals
$result_ratings = $db->fetchRow("SELECT COUNT(rating_id) as count FROM " . DB_PREFIX . "ratings");
$ratings = $result_ratings['count'];

// Output Header
include ('header.php');
?>

<div id="dashboard">

    <h1>Dashboard</h1>

    <?php if ($first_run): ?>
    <div class="success">
        <p>All done! Your video site is now ready for use. This is your admin panel,
        we went ahead and logged you in so that you can start exploring.</p>

        <p>Your login for the main site and the admin panel are one in the same. To
        enter the admin panel simply login and click on 'Admin'.</p>

        <p>Thank you for choosing CumulusClips as your video sharing platform.</p>
        <p><a href="<?=HOST?>/" class="button">View My Site</a></p>
    </div>
    <?php endif; ?>


    <div id="news" class="block">
        <h2>News from the mothership</h2>
        <div><p class="loading">Loading...</p></div>
    </div>

    <div class="block">
        <h2>Totals Report</h2>
        <p><strong>Videos: </strong><?=$videos?></p>
        <p><strong>Members: </strong><?=$members?></p>
        <p><strong>Comments: </strong><?=$comments?></p>
        <p><strong>Ratings: </strong><?=$ratings?></p>
    </div>

</div>

<?php include ('footer.php'); ?>