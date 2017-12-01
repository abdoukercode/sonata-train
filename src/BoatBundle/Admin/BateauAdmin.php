<?php
/**
 * Created by PhpStorm.
 * User: abdou
 * Date: 24/11/17
 * Time: 08:44
 */

namespace BoatBundle\Admin;

use BoatBundle\Entity\Bateau;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Form\FormMapper;


class BateauAdmin extends AbstractAdmin
{
    protected function configureFormFields(FormMapper $formMapper)
    {
        $formMapper->add('nom', 'text');
    }

    protected function configureDatagridFilters(DatagridMapper $datagridMapper)
    {
        $datagridMapper->add('nom');
    }

    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper->addIdentifier('nom');
    }



    public function toString($object)
    {
        return $object instanceof Bateau
            ? $object->getNom()
            : 'Bateau'; // shown in the breadcrumb on the create view
    }
}