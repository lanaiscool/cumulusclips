<?php $this->SetLayout ('myaccount'); ?>

<h1><?=Language::GetText('subscriptions_header')?></h1>

<?php if ($message): ?>
    <div class="message <?=$message_type?>"><?=$message?></div>
<?php endif; ?>


<?php if (count($subscriptions) > 0): ?>

    <div class="member_list">
    <?php foreach ($subscriptions as $subscription): ?>
        <div>
            <?php $avatar = $this->getService('User')->getAvatarUrl($subscription); ?>
            <p><a href="<?=HOST?>/members/<?=$subscription->username?>/" title="<?=$subscription->username?>"><img src="<?=($avatar) ? $avatar : THEME . '/images/avatar.gif'?>" alt="<?=$subscription->username?>" /></a></p>
            <p><a href="<?=HOST?>/members/<?=$subscription->username?>/" title="<?=$subscription->username?>"><?=Functions::CutOff ($subscription->username,18)?></a></p>
            <p class="actions small"><a class="confirm" data-node="confirm_subscription" href="<?=HOST?>/myaccount/subscriptions/<?=$subscription->userId?>/" title="<?=Language::GetText('unsubscribe')?>"><?=Language::GetText('unsubscribe')?></a></p>
        </div>
    <?php endforeach; ?>

    </div>
    <?=$pagination->Paginate()?>

<?php else: ?>
    <p><strong><?=Language::GetText('no_subscriptions')?></strong></p>
<?php endif; ?>