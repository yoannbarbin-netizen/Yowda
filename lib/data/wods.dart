/// WOD (Workout of the Day) : séances composées qui référencent uniquement
/// des exercices existants de la bibliothèque (aucun exercice inventé ici).
/// Les noms doivent correspondre EXACTEMENT à ceux du catalogue.
class Wod {
  final String nom;
  final String format; // For Time, AMRAP, EMOM, Tabata, Intervalles
  final String duree; // durée ou structure indicative
  final String niveau;
  final String description;
  final List<String> exercices;

  const Wod({
    required this.nom,
    required this.format,
    required this.duree,
    required this.niveau,
    required this.description,
    required this.exercices,
  });
}

const List<Wod> wods = [
  Wod(
    nom: "Découverte",
    format: "For Time",
    duree: "3 tours · ~10 min",
    niveau: "Débutant",
    description:
        "Ton premier WOD. 3 tours à ton rythme, 1 min de repos entre les tours. La technique avant la vitesse. Adapte : pompes sur les genoux si besoin.",
    exercices: ["Squats au poids du corps", "Pompes inclinées (mains au mur)", "Fentes alternées", "Chaise contre un mur"],
  ),
  Wod(
    nom: "Tabata cardio",
    format: "Tabata",
    duree: "4 blocs de 4 min",
    niveau: "Débutant",
    description:
        "Un exercice par bloc : 20 s d'effort, 10 s de repos, 8 fois. Récupère 1 min entre les blocs. Reste régulier, ne pars pas trop vite.",
    exercices: ["Sprint sur place", "Jumping jacks", "Montées de genoux", "Talons-fesses"],
  ),
  Wod(
    nom: "EMOM première fois",
    format: "EMOM",
    duree: "8 min",
    niveau: "Débutant",
    description:
        "Chaque minute démarre un nouveau travail, le reste de la minute est du repos. Minute impaire : 8 squats. Minute paire : 6 pompes sur les genoux.",
    exercices: ["Squats au poids du corps", "Pompes sur les genoux"],
  ),
  Wod(
    nom: "Cindy",
    format: "AMRAP",
    duree: "20 min",
    niveau: "Intermédiaire",
    description:
        "Le classique : un maximum de tours en 20 min. 5 tractions, 10 pompes, 15 squats. Adapte les tractions (élastique ou sautées) pour garder le rythme.",
    exercices: ["Tractions pronation", "Pompes classiques", "Squats"],
  ),
  Wod(
    nom: "Fran",
    format: "For Time",
    duree: "21-15-9 · ~8 min",
    niveau: "Avancé",
    description:
        "21 puis 15 puis 9 répétitions de chaque exercice, le plus vite possible. Charge légère à modérée : c'est le cardio qui doit limiter, pas le poids.",
    exercices: ["Thruster", "Tractions pronation"],
  ),
  Wod(
    nom: "Murph allégé",
    format: "For Time",
    duree: "1 tour · ~20 min",
    niveau: "Avancé",
    description:
        "Version allégée du Murph : 400 m de course, puis 30 tractions, 60 pompes, 90 squats, puis re-400 m si tu as encore de l'énergie. Fractionne les séries comme tu veux.",
    exercices: ["Sprint 400 m", "Tractions pronation", "Pompes classiques", "Squats"],
  ),
  Wod(
    nom: "Tabata gainage",
    format: "Tabata",
    duree: "4 blocs de 4 min",
    niveau: "Débutant à intermédiaire",
    description:
        "20 s de gainage, 10 s de repos, 8 fois par exercice. Un exercice par bloc : planche, planche latérale (change de côté au milieu), hollow body, arch hold.",
    exercices: ["Planche (gainage)", "Planche latérale", "Hollow body", "Arch Hold"],
  ),
  Wod(
    nom: "EMOM haltéro léger",
    format: "EMOM",
    duree: "10 min",
    niveau: "Intermédiaire",
    description:
        "Minute impaire : 3 power cleans. Minute paire : 6 push press. Barre légère : chaque répétition doit être propre, même fatigué.",
    exercices: ["Power Clean", "Push Press"],
  ),
  Wod(
    nom: "Le mur des abdos",
    format: "For Time",
    duree: "5 tours · ~12 min",
    niveau: "Intermédiaire",
    description:
        "5 tours : 15 crunchs, 12 relevés de jambes, 10 dead bugs, 20 s de shoulder taps. Repos court entre les tours (30 s max).",
    exercices: ["Crunchs", "Relevé de jambes", "Dead bug", "Plank Shoulder Taps"],
  ),
  Wod(
    nom: "AMRAP kettlebell",
    format: "AMRAP",
    duree: "12 min",
    niveau: "Intermédiaire",
    description:
        "En 12 min, un maximum de tours : 10 swings, 8 goblet squats, 6 kettlebell snatches (3 par bras), 20 s de marche du fermier. Kettlebell légère pour tenir.",
    exercices: ["Swing", "Goblet squat", "Kettlebell Snatch", "Marche du fermier"],
  ),
  Wod(
    nom: "Box & sauts",
    format: "AMRAP",
    duree: "10 min",
    niveau: "Intermédiaire",
    description:
        "Un maximum de tours en 10 min : 10 box jumps, 10 box step-overs, 6 burpee broad jumps, 30 double sauts. Adapte la hauteur de la box.",
    exercices: ["Box Jump", "Box Step-over", "Burpee Broad Jump", "Double saut"],
  ),
  Wod(
    nom: "Pyramide de sprints",
    format: "Intervalles",
    duree: "~25 min",
    niveau: "Intermédiaire à avancé",
    description:
        "Échauffement 5 min de course, puis pyramide : 100 m, 200 m, 400 m, 200 m, 100 m. Repos : le temps de la course. Termine par 5 min de retour au calme.",
    exercices: ["Sprint 100 m", "Sprint 200 m", "Sprint 400 m"],
  ),
  Wod(
    nom: "Ergathlon",
    format: "For Time",
    duree: "3 tours · ~15 min",
    niveau: "Intermédiaire",
    description:
        "3 tours : 40 s de SkiErg, 40 s d'Assault Bike, 40 s de rameur, puis 1 min de repos. Donne tout sur chaque engin, tiens la même intensité aux 3 tours.",
    exercices: ["SkiErg", "Assault Bike", "Rame continue 10 à 20 min"],
  ),
  Wod(
    nom: "Sandbag",
    format: "For Time",
    duree: "5 tours · ~15 min",
    niveau: "Avancé",
    description:
        "5 tours : 6 sandbag cleans, 40 m de portage en ours, 8 burpee broad jumps. Sac posé au sol entre les mouvements, respire avant chaque série.",
    exercices: ["Sandbag Clean", "Bear Hug Sandbag Carry", "Burpee Broad Jump"],
  ),
  Wod(
    nom: "Gymnastique du jour",
    format: "EMOM",
    duree: "12 min (4 tours de 3 min)",
    niveau: "Avancé",
    description:
        "Min 1 : 5 toes to bar. Min 2 : 8 ring dips. Min 3 : 30 s de handstand hold. Répète 4 fois. Si tu casses la technique, réduis les répétitions.",
    exercices: ["Toes to Bar", "Ring Dips", "Handstand Hold"],
  ),
  Wod(
    nom: "Core express",
    format: "For Time",
    duree: "3 tours · ~8 min",
    niveau: "Débutant",
    description:
        "3 tours : 15 crunchs, 12 sit-ups, 20 s de hollow body. Repos 30 s entre les tours. Concentre-toi sur la respiration, pas la vitesse.",
    exercices: ["Crunchs", "Sit-ups CrossFit", "Hollow body"],
  ),
];
