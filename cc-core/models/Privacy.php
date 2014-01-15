<?php

class Privacy
{
    const NEW_VIDEO = 'newVideo';
    const VIDEO_COMMENT = 'videoComment';
    const NEW_MESSAGE = 'newMessage';
    const VIDEO_READY = 'videoReady';

    /**
     * @var int
     */
    public $privacyId;
    
    /**
     * @var int
     */
    public $userId;
    
    /**
     * @var boolean
     */
    public $videoComment;
    
    /**
     * @var boolean
     */
    public $newMessage;
    
    /**
     * @var boolean
     */
    public $newVideo;
    
    /**
     * @var boolean
     */
    public $videoReady;
}