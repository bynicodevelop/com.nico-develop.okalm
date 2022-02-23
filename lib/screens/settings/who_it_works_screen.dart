import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const content = """
## Qu'est-ce que la cohérence cardiaque ?

La cohérence cardiaque vous **permet de mieux gérer votre stress et vos émotions**, ainsi que de réduire la dépression et votre tension artérielle.

C'est **une pratique simple à mettre en place**. 

Elle entraîne de nombreux bienfaits sur votre santé physique, mentale et émotionnelle.

La cohérence cardiaque vous permet d'**apprendre à contrôler sa respiration** afin de réguler votre stress et votre anxiété. 

## Les bienfaits de la cohérence cardiaque sur votre santé

Pratiquer la cohérence cardiaque présente de nombreux bénéfices, à court terme comme à long terme.

### Effets immédiats

* Augmentation de l’amplitude de la variabilité cardiaque
* Arrondissement et régularité de la courbe
* Apaisement

### Effets à long terme

* Diminution de l’hypertension artérielle
* Diminution du risque cardiovasculaire
* Régulation du taux de sucre
* Réduction du périmètre abdominal
* Meilleure récupération
* Amélioration de la concentration et de la mémorisation
* Diminution des troubles de l’attention et de l’hyperactivité
* Meilleure tolérance à la douleur
* Amélioration de la maladie asthmatique
* Amélioration des maladies inflammatoire

## La cohérence cardiaque en pratique

Il vous faut prévoir 3 séances de 5 minutes par jour.

Cela représente 6 respirations par minute.

Ces chiffres ont une raison physiologique et sont basés sur de nombreuses études.

Une durée moyenne de 4 heures entre chaque pratique est donc recommandée.

La raison est que les effets bénéfiques de la pratique ne persistent que quelques heures (3 à 6 heures).

Idéalement, votre posture doit être assise et le dos droit.

Pour des raisons anatomiques et physiologiques, la cohérence cardiaque ne fonctionne pas bien en position couchée.

Cette application vous permet de **contrôler votre respiration** et de **réguler votre stress**.

## Comment fonctionne votre corps ?

Le corps régit par deux grands systèmes nerveux, le système somatique (actes volontaires) et le système autonome (régulation automatique).

Le cœur participe activement au système nerveux autonome dont il occupe une fonction essentielle permettant l’adaptation aux changements environnementaux.

La variabilité cardiaque désigne la variabilité de la fréquence cardiaque ou la capacité du cœur à accélérer et à ralentir.

Le système nerveux autonome est partagé en deux sous-systèmes :

* **Le sympathique** déclenche toutes les actions nécessaires à la fuite ou au combat mais aussi l’accélération de la fréquence cardiaque et respiratoire ainsi que la dilatation des pupilles ou l’inhibition de la digestion.

* **Le parasympathique** favorise quant à lui la récupération, la relaxation, le repos, la réparation…

Votre santé dépend de l’équilibre entre le sympathique et le parasympathique.

## Pourquoi la cohérence cardiaque fonctionne ?

L’inspiration stimule le sympathique lorsque l’expiration stimule le parasympathique.

La respiration étant contrôlée par le système nerveux autonome ET par le système nerveux somatique, il est donc possible de contrôler le système nerveux autonome par cette voie.

C'est grâce à une respiration équilibrée que vous allez pouvoir gérer votre cohérence cardiaque 

Cet équilibre se fait par une série de respirations : 

**Cinq secondes à l’inspiration, cinq secondes à l’expiration, soit six respirations par minute.**

Lorsque l'on respire six fois par minute on est pratiquement certain d’atteindre cet état d’équilibre de cohérence cardiaque.
""";

class HowItWorkScreen extends StatelessWidget {
  const HowItWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La cohérence cardiaque'),
      ),
      body: Markdown(
        data: content,
        paddingBuilders: <String, MarkdownPaddingBuilder>{
          'p': PPaddingBuilder(),
          'h2': HealinePaddingBuilder(),
        },
      ),
    );
  }
}

class PPaddingBuilder extends MarkdownPaddingBuilder {
  @override
  EdgeInsets getPadding() => const EdgeInsets.only(
        bottom: 8.0,
      );
}

class HealinePaddingBuilder extends MarkdownPaddingBuilder {
  @override
  EdgeInsets getPadding() => const EdgeInsets.only(
        bottom: 10.0,
      );
}
