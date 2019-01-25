<?php

namespace App\Controller;



use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;


class SiteController extends AbstractController
{
    /**
     * @Route("/site", name="site")
     */
    public function index()
    {
        return $this->render('site/home.html.twig', [
            'controller_name' => 'SiteController',
        ]);
    }

    /**
     * @Route("/", name="HomePh")
     */
    public function home()
    {
        $phar = $this->getUser();

        return $this->render('site/pharmacy.html.twig', [
            'userPh' => $phar
        ]);
    }


}
