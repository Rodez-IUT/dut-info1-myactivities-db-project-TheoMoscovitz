2.1 Problèmes posés par cette fonction "create_activity_with_owner".

Cette fonction posent différents problèmes telle qu'elle est écrite.
Pouvez-vous identifiez et expliquez les problèmes qu'elle pose ?


- On doit connaitre quels sont les identifiants déjà utilisés. Si un identifiant est déjà utilisé, on ne peut plus le réutiliser pour insérer une nouvelle activitée.
- On ne peut pas se servir comme propriétaire un utilisateur déjà existant pour ajouter une activitée via la fonction.


2.2 Propositions de solution

Que faudrait-il pouvoir faire dans cette fonction pour résoudre les problèmes soulevés précédemment ?


- Soit il faut un tableau avec tous les identifiants utilisés, soit il faut une génération automatique d'identifiants.
- Il faudrait qu'un utilisateur qui existe déjà avec tel "id" puisse être affecté comme administrateur, propriétaire à la base de données.