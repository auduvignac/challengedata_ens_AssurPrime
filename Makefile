# Makefile

VENV_DIR=.venv/assurprime_modeling_workflow
PYTHON=python3

# Création de l'environnement virtuel
create:
	$(PYTHON) -m venv $(VENV_DIR)
	@echo "Environnement virtuel créé dans $(VENV_DIR)"

# Activation + installation des dépendances
install: create
	. $(VENV_DIR)/bin/activate && pip install --upgrade pip \
	&& pip install -r requirements-dev.txt
	@echo "Dépendances installées"

# Lancer pre-commit sur tous les fichiers
format:
	. $(VENV_DIR)/bin/activate && pre-commit run --all-files

# Lancer pre-commit sur un fichier donné
format-file:
	@echo "Formatage d'un seul fichier (utiliser : make format-file FILE=nom_fichier)"
	. $(VENV_DIR)/bin/activate && pre-commit run --hook-stage manual --files $(FILE)

# Nettoyage de l’environnement
clean:
	rm -rf $(VENV_DIR)
	@echo "Environnement supprimé"