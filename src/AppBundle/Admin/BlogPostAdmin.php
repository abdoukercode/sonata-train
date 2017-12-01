<?php
/**
 * Created by PhpStorm.
 * User: abdou
 * Date: 24/11/17
 * Time: 23:34
 */

namespace AppBundle\Admin;

use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Form\FormMapper;

use Sonata\AdminBundle\Datagrid\DatagridMapper;

class BlogPostAdmin extends AbstractAdmin
{


    public $supportsPreviewMode = true;
    protected function configureFormFields(FormMapper $formMapper)
    {


        $formMapper

            ->with('Content', array('class' => 'col-md-9'))
            ->add('title', 'text')
            ->add('body','ckeditor',array('jquery'=>true))

            ->add('picture', 'sonata_media_type', array(
                'provider' => 'sonata.media.provider.image',
                'context'  => 'default'
            ))
            ->add('enabled', null, array(
                'label'=>"Actif"
            ))
            ->add('positionImage', null, array(
                'label'=>"Image à gauche"
            ))



            ->end()


            ->with('Meta data', array('class' => 'col-md-3'))
            ->add('category', 'sonata_type_model', array(
                'class' => 'AppBundle\Entity\Category',
                'property' => 'name',
            ))
            ->end()

        ;
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper

            ->addIdentifier('title','text', array(
                'header_style' => 'width: 25%; text-align: center',
                'row_align' => 'center',
                'label'=>"Titre"
            ))

            ->add('body','html', array('header_style' => 'width: 45%', 'label'=>'Contenu'))
            //->add('picture', null, array('template' => 'AppBundle:Default:l'))
//             ->add('picture', 'sonata_media_type', array(
//                'provider' => 'sonata.media.provider.image',
//                'context'  => 'picture'
//            ))
            //->add('picture', 'image')
            ->addIdentifier('picture', 'string', array('template' => 'SonataMediaBundle:MediaAdmin:list_image.html.twig','header_style' => 'width: 15%', 'label'=>'Image'))
            ->add('enabled',null, array(
                'label'=>"Actif"
            ))
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
            ->add('title')
            ->add('category', null, array(), 'entity', array(
                'class'    => 'AppBundle\Entity\Category',
                'choice_label' => 'name', // In Symfony2: 'property' => 'name'
            ))
            ->add('enabled',null, array(
                'label'=>"Actif"
            ))
        ;
    }



    public function toString($object)
    {
        return $object instanceof BlogPost
            ? $object->getTitle()
            : 'Blog Post'; // shown in the breadcrumb on the create view
    }
}