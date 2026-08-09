#  Projet Data Warehouse & dbt — Northwind DWH

Ce projet met en place un Data Warehouse complet sous **PostgreSQL** pour l'entreprise **Northwind**, transformé et modélisé avec **dbt (data build tool)**.

---

##  Architecture du Projet

Le projet suit l'architecture moderne de modélisation dbt :
1. **Staging (`models/staging/`) :** Nettoyage des données sources et renommage des colonnes (8 modèles).
2. **Intermediate (`models/intermediate/`) :** Jointures, agrégations intermédiaires et règles métier (6 modèles).
3. **Marts (`models/marts/`) :** Modélisation en schéma en étoile (Star Schema) :
   * `fact_orders` (Table de faits)
   * `dim_customers`
   * `dim_employees`
   * `dim_products`
   * `dim_shippers`
   * `dim_temps`
   * *(Bonus)* `mart_employee_performance` avec Window Functions (`ROW_NUMBER`, `DENSE_RANK`).

---

## Instructions d'installation et d'exécution

### 1. Prérequis
* PostgreSQL & pgAdmin
* dbt-postgres

### 2. Installation
```bash
# Activer l'environnement virtuel 
# ..\envDemo\Scripts\Activate.ps1

# Installer les dépendances
pip install -r requirements.txt

# Exécution des commandes dbt

# Vérifier la connexion à la base de données
dbt debug

# Exécuter les modèles et les tests qualité
dbt build

# Générer et visualiser la documentation interactive et le Lineage Graph
dbt docs generate
dbt docs serve

##  Livrables & Preuves d'exécution

### 1. Validation `dbt build`
![dbt build success](./dbt-build.png)
> **Explication :** La commande `dbt build` confirme la création réussie de tous les modèles (6 tables et 14 vues) ainsi que le passage au vert des **26 tests de qualité** (unicité, non-nullité et intégrité référentielle).

### 2. Lineage Graph 
![Lineage Graph](./Lineage-Graph.png)
> **Explication :** Ce graphe interactif issu de `dbt docs` illustre le flux de transformation des données Northwind, depuis les tables sources jusqu'aux modèles intermédiaires et marts analytiques.
