<?php
class Song{
    private $id;

    private $title;
    
    private $rel_date;
    
    private $album_id;
   
    /**
	 * @return string
	 */
	public function getAlbum_id() {
		return $this->album_id;
	}

	/**
	 * @return string
	 */
	public function getRel_date() {
		return $this->rel_date;
	}

	/**
	 * @return string
	 */
	public function getTitle() {
		return $this->title;
	}

	/**
	 * @return int
	 */
	public function getId() {
		return $this->id;
	}
}