<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    /**
     * @Route("/posts", name="posts_list")
     */
    public function postsAction(Request $request)
    {
        $post=  $this->getDoctrine()->getRepository('AppBundle:BlogPost')->findAll();
//var_dump($post[0]);die;
        // replace this example code with whatever you need
        return $this->render(':default:posts.html.twig',array(
            'posts'=>$post

            )
        );
    }
}
