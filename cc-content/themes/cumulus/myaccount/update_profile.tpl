
<h1><?=Language::GetText('profile_header')?></h1>

<?php if ($error_msg): ?>
    <div id="error"><?=$error_msg?></div>
<?php elseif ($success_msg): ?>
    <div id="success"><?=$success_msg?></div>
<?php endif; ?>


<div class="block">

    <p class="row-shift large"><?=Language::GetText('personal_header')?></p>
    <p class="row-shift"><?=Language::GetText('asterisk')?></p>
    <form action="<?=HOST?>/myaccount/profile/" method="post" id="update-profile-form">

        <div class="row<?=(isset ($Errors['first_name'])) ? ' errors' : ''?>">
            <label><?=Language::GetText('first_name')?>:</label>
            <input class="text" type="text" name="first_name" value="<?=(isset ($data['first_name'])) ? $data['first_name'] : $user->first_name?>" />
        </div>

        <div class="row<?=(isset ($Errors['last_name'])) ? ' errors' : ''?>">
            <label><?=Language::GetText('last_name')?>:</label>
            <input class="text" type="text" name="last_name" value="<?=(isset ($data['last_name'])) ? $data['last_name'] : $user->last_name?>" />
        </div>

        <div class="row<?=(isset ($Errors['email'])) ? ' errors' : ''?>">
            <label>*<?=Language::GetText('email')?>:</label>
            <input class="text" type="text" name="email" value="<?=(isset ($data['email'])) ? $data['email'] : $user->email?>" />
        </div>

        <div class="row<?=(isset ($Errors['website'])) ? ' errors' : ''?>">
            <label><?=Language::GetText('website')?>:</label>
            <input class="text" type="text" name="website" value="<?=(isset ($data['website'])) ? $data['website'] : $user->website?>" />
        </div>

        <div class="row<?=(isset ($Errors['about_me'])) ? ' errors' : ''?>">
            <label><?=Language::GetText('about_me')?>:</label>
            <textarea class="text" name="about_me"><?=(isset ($data['about_me'])) ? $data['about_me'] : $user->about_me?></textarea>
        </div>

        <div class="row-shift">
            <input type="hidden" value="yes" name="submitted" />
            <a href="" class="button"><span><?=Language::GetText('profile_button')?></span></a>
        </div>
        
    </form>

</div>


<h1>Update Picture</h1>

<div class="block" id="update-picture">

    <div class="option">
        <input type="radio" name="source" name="upload" id="option-upload" checked="checked"/>
        <label for="option-upload">Upload an Image</label>
    </div>

    <div class="option">
        <input type="radio" name="source" name="gravatar" id="option-gravatar" />
        <label for="option-gravatar">Use <a href="http://gravatar.com" title="Gravatar">Gratavar</a></label>
    </div>

    <p>Select an image (jpeg, gif, png) from your computers hard drive. Max
    allowed filesize is 30K.</p>

    <input type="text" class="text" name="overlay" id="upload-visible" disabled="disabled" />
    <a href="" class="button" id="browse"><span>Browse Files</span></a>
    <form action="<?=HOST?>/myaccount/profile/" method="post"  enctype="multipart/form-data">
        <input type="file" name="upload" id="upload" size="36" onChange="getElementById('upload-visible').value = getElementById('upload').value;" />
        <a href="" class="button"><span>Upload Picture</span></a>
    </form>



</div>
