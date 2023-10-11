<?php
class Album{
    private $id;
    private $title;
    private $rel_date;
    
    private $review;

    private $artist;

    private $genre;

    private $rating;

    
	public function setValues($title, $rel_date, $review, $artist, $genre, $rating){
		$this->id = null;		
		$this->title = $title;
		$this->rel_date = $rel_date;
		$this->review = $review;
		$this->artist = $artist;
		$this->$genre = $genre;
		$this->rating = $rating;
	}

	/**
	 * @return float
	 */
	public function getRating() {
		return $this->rating;
	}

	/**
	 * @return string
	 */
	public function getGenre() {
		return $this->genre;
	}

	/**
	 * @return string
	 */
	public function getArtist() {
		return $this->artist;
	}

	/**
	 * @return string
	 */
	public function getReview() {
		return $this->review;
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