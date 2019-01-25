<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Pharmacies;
use App\Form\RegistrationType;
use App\Form\PermanentType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class SecurityController extends AbstractController
{
    /**
     * @Route("/inscription", name="security_registration")
     */
    public function registration(Request $request, ObjectManager $manager, UserPasswordEncoderInterface $encoder)
    {

    	$pharmacy = new Pharmacies();

    	$form = $this->createform(RegistrationType::class, $pharmacy);

    	$form->handleRequest($request);

    	if($form->isSubmitted() && $form->isValid()){

    		$hash = $encoder->encodePassword($pharmacy, $pharmacy->getPassword());// encrypt the password

    		$pharmacy->setPassword($hash);

            $pharmacy->setPermanence(false); //set the normal time as default

    		$manager->persist($pharmacy);
    		$manager->flush(); 

    		return $this->redirectToRoute('security_login');
    	}
    	

        return $this->render('security/registration.html.twig', [
        		'form' => $form->createView()
        ]);
    }


    /**
     * @Route("/connexion", name="security_login")
     */
    public function signin(){

    	return $this->render('security/signin.html.twig');
    }

     /**
     * @Route("/deconnexion", name="security_logout")
     */
    public function signout() {}


     /**
     * @Route("/compte{id}", name="security_compte")
     */
    public function modifierCompte(Request $request){//update user profil

        $phar = $this->getUser();
        //Récupération du formulaire
        $form = $this->createForm(RegistrationType::class, $phar);//Lien Objet géré par le formulaire -> Requête soumission du formulaire

        $form-> handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid()){

            $em = $this->getDoctrine()->getManager();
           
            $em->flush();
        }
        //Génération du code HTML pour le formulaire créé
        $formView = $form->createView();
        //Affichage de la vue
        return $this->render('gestion/edit_profil.html.twig', [
            'formProf' => $formView,
            'userPh' => $phar
            
        ]);
    }

/**
     
     * @Route("/setPermanence{id}", name="security_permanence")
     */
    public function isPermanent(Request $request){// to set the permanence time

        $phar = $this->getUser();

         //Récupération du formulaire
        $form = $this->createForm(PermanentType::class, $phar);//Lien Objet géré par le formulaire -> Requête soumission du formulaire

        $form-> handleRequest($request);
        
        if($form->isSubmitted() && $form->isValid()){

            $em = $this->getDoctrine()->getManager();
            if($phar->getPermanence()){
             $isperm = $phar->setPermanence(false);
             $this->get('session')->getFlashBag()->add(
                'nb',
                'Vous êtes en horaire normal !'); 
            }
            else{
            $isperm = $phar->setPermanence(true);
            $this->get('session')->getFlashBag()->add(
                'nb',
                'Vous êtes en permanence !'); 
            }

            $em->flush();

        }

        
        
         //Génération du code HTML pour le formulaire créé
        $formView = $form->createView();
        //Affichage de la vue
        return $this->render('security/perm.html.twig', array('formPerm'=>$formView));

    }

}
