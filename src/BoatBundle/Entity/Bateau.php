<?php

namespace BoatBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Bateau
 *
 * @ORM\Table(name="bateau")
 * @ORM\Entity(repositoryClass="BoatBundle\Repository\BateauRepository")
 */
class Bateau
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="string", length=255)
     */
    private $nom;

    /**
     * @ORM\OneToMany(targetEntity="StageBundle\Entity\Voyage", mappedBy="bateau")
     */
    private $voyages;

    /**
     * @return mixed
     */
    public function getVoyages()
    {
        return $this->voyages;
    }

    /**
     * @param mixed $voyages
     */
    public function setVoyages($voyages)
    {
        $this->voyages = $voyages;
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set nom
     *
     * @param string $nom
     *
     * @return Bateau
     */
    public function setNom($nom)
    {
        $this->nom = $nom;

        return $this;
    }

    /**
     * Get nom
     *
     * @return string
     */
    public function getNom()
    {
        return $this->nom;
    }

    public function __toString() {
        return $this->getNom();
    }


}

