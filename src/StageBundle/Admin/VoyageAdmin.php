<?php
/**
 * Created by PhpStorm.
 * User: abdou
 * Date: 24/11/17
 * Time: 23:34
 */

namespace StageBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;

use Sonata\AdminBundle\Datagrid\DatagridMapper;
use StageBundle\Entity\Voyage;

class VoyageAdmin extends AbstractAdmin
{


    public $supportsPreviewMode = true;
    protected function configureFormFields(FormMapper $formMapper)
    {


        $formMapper

            ->add('destination', 'text')
            ->add('date_depart','sonata_type_date_picker',   array(
                'dp_language' => 'fr',
                'format' => 'dd.MM.yyyy',
                ))

            ->add('date_arrivee', 'sonata_type_date_picker',  array(
                'dp_language' => 'fr',
                'format' => 'dd.MM.yyyy',
            ))
            ->add('prix')
            ->add('bateau', 'sonata_type_model', array(
                'class' => 'BoatBundle\Entity\Bateau',
                'property' => 'nom',
            ))
            ->add('actif', null, array(
                'label'=>"Actif"
            ))

//            ->add('category', 'sonata_type_model', array(
//                'class' => 'AppBundle\Entity\Category',
//                'property' => 'name',
//            ))


        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->add('id')
            ->addIdentifier('destination')
            ->add('dateDepart', 'date',array(
                'pattern' => 'dd MMM y',

            ))

            ->add('dateArrivee', 'date',array(
                'pattern' => 'dd MMM y',

            ))
            ->add('prix')
            ->add('actif', null, array(
                'label'=>"Actif"
            ))
            ->add('bateau', 'text')
            ->add('_action', null, array(
                'actions' => array(
                    'edit' => array(
                    ),
                    'delete' => array(

                    ),
                )
            ))
        ;
    }


    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper
            ->add('dateDepart', 'doctrine_orm_date_range', [
                'field_type'=>'sonata_type_date_range_picker',
                'field_options' => [
                    'field_options' => [
                        'format' => 'yyyy-MM-dd'
                    ]
                ]])
            ->add('dateArrivee', 'doctrine_orm_date_range', [
                    'field_type'=>'sonata_type_date_range_picker',
                    'field_options' => [
                        'field_options' => [
                            'format' => 'yyyy-MM-dd'
                        ]
                    ]]
)
            ->add('destination')

            ->add('bateau', null, array(), 'entity', array(
                'class'    => 'BoatBundle\Entity\Bateau',
                'choice_label' => 'nom', // In Symfony2: 'property' => 'name'
            ))
            ->add('actif',null, array(
                'label'=>"Actif"
            ))
        ;
    }



    public function toString($object)
    {
        return $object instanceof Voyage
            ? $object->getId()
            : 'Voyage'; // shown in the breadcrumb on the create view
    }
}