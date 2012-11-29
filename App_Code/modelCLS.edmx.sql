
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/29/2012 10:00:43
-- Generated from EDMX file: C:\GitHub\cls-inc\App_Code\modelCLS.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjetRegulier2012_06];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AbonnementGroupe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AbonnementJeu] DROP CONSTRAINT [FK_AbonnementGroupe];
GO
IF OBJECT_ID(N'[dbo].[FK_AbonnementMembres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AbonnementJeu] DROP CONSTRAINT [FK_AbonnementMembres];
GO
IF OBJECT_ID(N'[dbo].[FK_Animateur_inherits_Membres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MembresJeu_Animateur] DROP CONSTRAINT [FK_Animateur_inherits_Membres];
GO
IF OBJECT_ID(N'[dbo].[FK_AnimateurCours]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CoursJeu] DROP CONSTRAINT [FK_AnimateurCours];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursCompleteMembres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CoursCompleteJeu] DROP CONSTRAINT [FK_CoursCompleteMembres];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursCoursComplete]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CoursCompleteJeu] DROP CONSTRAINT [FK_CoursCoursComplete];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursGroupe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GroupeJeu] DROP CONSTRAINT [FK_CoursGroupe];
GO
IF OBJECT_ID(N'[dbo].[FK_CoursListeAttente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ListeAttenteJeu] DROP CONSTRAINT [FK_CoursListeAttente];
GO
IF OBJECT_ID(N'[dbo].[FK_GroupeJeuHoraire]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HoraireJeu] DROP CONSTRAINT [FK_GroupeJeuHoraire];
GO
IF OBJECT_ID(N'[dbo].[FK_ItemPanierGroupeJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ItemPanierJeu] DROP CONSTRAINT [FK_ItemPanierGroupeJeu];
GO
IF OBJECT_ID(N'[dbo].[FK_ItemPanierMembresJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ItemPanierJeu] DROP CONSTRAINT [FK_ItemPanierMembresJeu];
GO
IF OBJECT_ID(N'[dbo].[FK_JourSemaineHoraireJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HoraireJeu] DROP CONSTRAINT [FK_JourSemaineHoraireJeu];
GO
IF OBJECT_ID(N'[dbo].[FK_ListeAttenteMembres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ListeAttenteJeu] DROP CONSTRAINT [FK_ListeAttenteMembres];
GO
IF OBJECT_ID(N'[dbo].[FK_MembresJeuPanier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PanierJeu] DROP CONSTRAINT [FK_MembresJeuPanier];
GO
IF OBJECT_ID(N'[dbo].[FK_PanierItemPanier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ItemPanierJeu] DROP CONSTRAINT [FK_PanierItemPanier];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleJeuMembresJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MembresJeu] DROP CONSTRAINT [FK_RoleJeuMembresJeu];
GO
IF OBJECT_ID(N'[dbo].[FK_SessionGroupe_GroupeJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SessionGroupe] DROP CONSTRAINT [FK_SessionGroupe_GroupeJeu];
GO
IF OBJECT_ID(N'[dbo].[FK_SessionGroupe_SessionJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SessionGroupe] DROP CONSTRAINT [FK_SessionGroupe_SessionJeu];
GO
IF OBJECT_ID(N'[dbo].[FK_SpecialiteAnimateur_MembresJeu_Animateur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialiteAnimateur] DROP CONSTRAINT [FK_SpecialiteAnimateur_MembresJeu_Animateur];
GO
IF OBJECT_ID(N'[dbo].[FK_SpecialiteAnimateur_SpecialiteJeu]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SpecialiteAnimateur] DROP CONSTRAINT [FK_SpecialiteAnimateur_SpecialiteJeu];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AbonnementJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AbonnementJeu];
GO
IF OBJECT_ID(N'[dbo].[CoursCompleteJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CoursCompleteJeu];
GO
IF OBJECT_ID(N'[dbo].[CoursJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CoursJeu];
GO
IF OBJECT_ID(N'[dbo].[GroupeJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GroupeJeu];
GO
IF OBJECT_ID(N'[dbo].[HoraireJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HoraireJeu];
GO
IF OBJECT_ID(N'[dbo].[ItemPanierJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ItemPanierJeu];
GO
IF OBJECT_ID(N'[dbo].[JourSemaineJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[JourSemaineJeu];
GO
IF OBJECT_ID(N'[dbo].[ListeAttenteJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ListeAttenteJeu];
GO
IF OBJECT_ID(N'[dbo].[MembresJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembresJeu];
GO
IF OBJECT_ID(N'[dbo].[MembresJeu_Animateur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembresJeu_Animateur];
GO
IF OBJECT_ID(N'[dbo].[PanierJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PanierJeu];
GO
IF OBJECT_ID(N'[dbo].[RoleJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoleJeu];
GO
IF OBJECT_ID(N'[dbo].[SessionGroupe]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SessionGroupe];
GO
IF OBJECT_ID(N'[dbo].[SessionJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SessionJeu];
GO
IF OBJECT_ID(N'[dbo].[SpecialiteAnimateur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialiteAnimateur];
GO
IF OBJECT_ID(N'[dbo].[SpecialiteJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SpecialiteJeu];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[TarifsJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TarifsJeu];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AbonnementJeu'
CREATE TABLE [dbo].[AbonnementJeu] (
    [dateAbonnement] datetime  NOT NULL,
    [idAbonnement] smallint IDENTITY(1,1) NOT NULL,
    [Membres_idMembre] smallint  NOT NULL,
    [Groupe_idGroupe] smallint  NOT NULL
);
GO

-- Creating table 'CoursCompleteJeu'
CREATE TABLE [dbo].[CoursCompleteJeu] (
    [idCoursComplete] smallint IDENTITY(1,1) NOT NULL,
    [Cours_idCours] smallint  NOT NULL,
    [Membres_idMembre] smallint  NOT NULL
);
GO

-- Creating table 'CoursJeu'
CREATE TABLE [dbo].[CoursJeu] (
    [idCours] smallint IDENTITY(1,1) NOT NULL,
    [nomCours] nvarchar(50)  NOT NULL,
    [categorie] nvarchar(7)  NOT NULL,
    [description] nvarchar(500)  NULL,
    [prerequis] nvarchar(50)  NULL,
    [tarif] decimal(18,0)  NOT NULL,
    [dateDebutInscription] datetime  NOT NULL,
    [dateFinInscription] datetime  NOT NULL,
    [dateDebutCours] datetime  NOT NULL,
    [dateFinCours] datetime  NOT NULL,
    [Animateur_idMembre] smallint  NOT NULL,
    [groupeAgeMin] smallint  NOT NULL,
    [groupeAgeMax] smallint  NOT NULL,
    [groupeAgeMod] nvarchar(4)  NOT NULL
);
GO

-- Creating table 'GroupeJeu'
CREATE TABLE [dbo].[GroupeJeu] (
    [idGroupe] smallint IDENTITY(1,1) NOT NULL,
    [nomGroupe] nvarchar(20)  NOT NULL,
    [nbMax] smallint  NOT NULL,
    [Cours_idCours] smallint  NOT NULL,
    [noGroupe] smallint  NOT NULL
);
GO

-- Creating table 'HoraireJeu'
CREATE TABLE [dbo].[HoraireJeu] (
    [idHoraire] smallint IDENTITY(1,1) NOT NULL,
    [heureDebut] nvarchar(5)  NOT NULL,
    [heureFin] nvarchar(5)  NOT NULL,
    [noLocal] nvarchar(10)  NOT NULL,
    [GroupeJeu_idGroupe] smallint  NOT NULL,
    [JourSemaine_idSemaine] smallint  NOT NULL
);
GO

-- Creating table 'ItemPanierJeu'
CREATE TABLE [dbo].[ItemPanierJeu] (
    [idItemPanier] int IDENTITY(1,1) NOT NULL,
    [GroupeJeu_idGroupe] smallint  NOT NULL,
    [MembresJeu_idMembre] smallint  NOT NULL,
    [Panier_idCommande] int  NOT NULL
);
GO

-- Creating table 'JourSemaineJeu'
CREATE TABLE [dbo].[JourSemaineJeu] (
    [idSemaine] smallint IDENTITY(1,1) NOT NULL,
    [jourSemaine] nvarchar(9)  NOT NULL
);
GO

-- Creating table 'ListeAttenteJeu'
CREATE TABLE [dbo].[ListeAttenteJeu] (
    [idListeAttente] smallint IDENTITY(1,1) NOT NULL,
    [Cours_idCours] smallint  NOT NULL,
    [Membres_idMembre] smallint  NOT NULL
);
GO

-- Creating table 'MembresJeu'
CREATE TABLE [dbo].[MembresJeu] (
    [idMembre] smallint IDENTITY(1,1) NOT NULL,
    [nomMembre] nvarchar(25)  NOT NULL,
    [prenomMembre] nvarchar(25)  NOT NULL,
    [telephoneMembre] nvarchar(13)  NOT NULL,
    [motPasse] nvarchar(20)  NOT NULL,
    [adresse] nvarchar(40)  NOT NULL,
    [ville] nvarchar(25)  NOT NULL,
    [dateInscription] datetime  NOT NULL,
    [dateNaissance] datetime  NOT NULL,
    [courriel] nvarchar(50)  NOT NULL,
    [codePostal] nvarchar(7)  NOT NULL,
    [familleID] smallint  NOT NULL,
    [sexe] nvarchar(1)  NOT NULL,
    [RoleJeu_idRole] smallint  NOT NULL
);
GO

-- Creating table 'MembresJeu_Animateur'
CREATE TABLE [dbo].[MembresJeu_Animateur] (
    [idAnimateur] smallint IDENTITY(1,1) NOT NULL,
    [idMembre] smallint  NOT NULL
);
GO

-- Creating table 'PanierJeu'
CREATE TABLE [dbo].[PanierJeu] (
    [idCommande] int IDENTITY(1,1) NOT NULL,
    [MembresJeu_idMembre] smallint  NOT NULL
);
GO

-- Creating table 'RoleJeu'
CREATE TABLE [dbo].[RoleJeu] (
    [idRole] smallint IDENTITY(1,1) NOT NULL,
    [nomRole] nvarchar(15)  NOT NULL
);
GO

-- Creating table 'SessionJeu'
CREATE TABLE [dbo].[SessionJeu] (
    [idSession] smallint IDENTITY(1,1) NOT NULL,
    [nomSession] nvarchar(9)  NOT NULL,
    [debutSession] datetime  NOT NULL,
    [finSession] datetime  NOT NULL
);
GO

-- Creating table 'SpecialiteJeu'
CREATE TABLE [dbo].[SpecialiteJeu] (
    [idSpecialite] smallint IDENTITY(1,1) NOT NULL,
    [nomSpecialite] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TarifsJeu'
CREATE TABLE [dbo].[TarifsJeu] (
    [idTarif] int IDENTITY(1,1) NOT NULL,
    [tarifNouveauMembre] decimal(18,0)  NOT NULL,
    [rabais1Enfant] smallint  NOT NULL,
    [rabais2Enfant] smallint  NOT NULL,
    [rabais3Enfant] smallint  NOT NULL
);
GO

-- Creating table 'SessionGroupe'
CREATE TABLE [dbo].[SessionGroupe] (
    [GroupeJeu_idGroupe] smallint  NOT NULL,
    [SessionJeu_idSession] smallint  NOT NULL
);
GO

-- Creating table 'SpecialiteAnimateur'
CREATE TABLE [dbo].[SpecialiteAnimateur] (
    [MembresJeu_Animateur_idMembre] smallint  NOT NULL,
    [SpecialiteJeu_idSpecialite] smallint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idAbonnement] in table 'AbonnementJeu'
ALTER TABLE [dbo].[AbonnementJeu]
ADD CONSTRAINT [PK_AbonnementJeu]
    PRIMARY KEY CLUSTERED ([idAbonnement] ASC);
GO

-- Creating primary key on [idCoursComplete] in table 'CoursCompleteJeu'
ALTER TABLE [dbo].[CoursCompleteJeu]
ADD CONSTRAINT [PK_CoursCompleteJeu]
    PRIMARY KEY CLUSTERED ([idCoursComplete] ASC);
GO

-- Creating primary key on [idCours] in table 'CoursJeu'
ALTER TABLE [dbo].[CoursJeu]
ADD CONSTRAINT [PK_CoursJeu]
    PRIMARY KEY CLUSTERED ([idCours] ASC);
GO

-- Creating primary key on [idGroupe] in table 'GroupeJeu'
ALTER TABLE [dbo].[GroupeJeu]
ADD CONSTRAINT [PK_GroupeJeu]
    PRIMARY KEY CLUSTERED ([idGroupe] ASC);
GO

-- Creating primary key on [idHoraire] in table 'HoraireJeu'
ALTER TABLE [dbo].[HoraireJeu]
ADD CONSTRAINT [PK_HoraireJeu]
    PRIMARY KEY CLUSTERED ([idHoraire] ASC);
GO

-- Creating primary key on [idItemPanier] in table 'ItemPanierJeu'
ALTER TABLE [dbo].[ItemPanierJeu]
ADD CONSTRAINT [PK_ItemPanierJeu]
    PRIMARY KEY CLUSTERED ([idItemPanier] ASC);
GO

-- Creating primary key on [idSemaine] in table 'JourSemaineJeu'
ALTER TABLE [dbo].[JourSemaineJeu]
ADD CONSTRAINT [PK_JourSemaineJeu]
    PRIMARY KEY CLUSTERED ([idSemaine] ASC);
GO

-- Creating primary key on [idListeAttente] in table 'ListeAttenteJeu'
ALTER TABLE [dbo].[ListeAttenteJeu]
ADD CONSTRAINT [PK_ListeAttenteJeu]
    PRIMARY KEY CLUSTERED ([idListeAttente] ASC);
GO

-- Creating primary key on [idMembre] in table 'MembresJeu'
ALTER TABLE [dbo].[MembresJeu]
ADD CONSTRAINT [PK_MembresJeu]
    PRIMARY KEY CLUSTERED ([idMembre] ASC);
GO

-- Creating primary key on [idMembre] in table 'MembresJeu_Animateur'
ALTER TABLE [dbo].[MembresJeu_Animateur]
ADD CONSTRAINT [PK_MembresJeu_Animateur]
    PRIMARY KEY CLUSTERED ([idMembre] ASC);
GO

-- Creating primary key on [idCommande] in table 'PanierJeu'
ALTER TABLE [dbo].[PanierJeu]
ADD CONSTRAINT [PK_PanierJeu]
    PRIMARY KEY CLUSTERED ([idCommande] ASC);
GO

-- Creating primary key on [idRole] in table 'RoleJeu'
ALTER TABLE [dbo].[RoleJeu]
ADD CONSTRAINT [PK_RoleJeu]
    PRIMARY KEY CLUSTERED ([idRole] ASC);
GO

-- Creating primary key on [idSession] in table 'SessionJeu'
ALTER TABLE [dbo].[SessionJeu]
ADD CONSTRAINT [PK_SessionJeu]
    PRIMARY KEY CLUSTERED ([idSession] ASC);
GO

-- Creating primary key on [idSpecialite] in table 'SpecialiteJeu'
ALTER TABLE [dbo].[SpecialiteJeu]
ADD CONSTRAINT [PK_SpecialiteJeu]
    PRIMARY KEY CLUSTERED ([idSpecialite] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [idTarif] in table 'TarifsJeu'
ALTER TABLE [dbo].[TarifsJeu]
ADD CONSTRAINT [PK_TarifsJeu]
    PRIMARY KEY CLUSTERED ([idTarif] ASC);
GO

-- Creating primary key on [GroupeJeu_idGroupe], [SessionJeu_idSession] in table 'SessionGroupe'
ALTER TABLE [dbo].[SessionGroupe]
ADD CONSTRAINT [PK_SessionGroupe]
    PRIMARY KEY NONCLUSTERED ([GroupeJeu_idGroupe], [SessionJeu_idSession] ASC);
GO

-- Creating primary key on [MembresJeu_Animateur_idMembre], [SpecialiteJeu_idSpecialite] in table 'SpecialiteAnimateur'
ALTER TABLE [dbo].[SpecialiteAnimateur]
ADD CONSTRAINT [PK_SpecialiteAnimateur]
    PRIMARY KEY NONCLUSTERED ([MembresJeu_Animateur_idMembre], [SpecialiteJeu_idSpecialite] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Groupe_idGroupe] in table 'AbonnementJeu'
ALTER TABLE [dbo].[AbonnementJeu]
ADD CONSTRAINT [FK_AbonnementGroupe]
    FOREIGN KEY ([Groupe_idGroupe])
    REFERENCES [dbo].[GroupeJeu]
        ([idGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AbonnementGroupe'
CREATE INDEX [IX_FK_AbonnementGroupe]
ON [dbo].[AbonnementJeu]
    ([Groupe_idGroupe]);
GO

-- Creating foreign key on [Membres_idMembre] in table 'AbonnementJeu'
ALTER TABLE [dbo].[AbonnementJeu]
ADD CONSTRAINT [FK_AbonnementMembres]
    FOREIGN KEY ([Membres_idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AbonnementMembres'
CREATE INDEX [IX_FK_AbonnementMembres]
ON [dbo].[AbonnementJeu]
    ([Membres_idMembre]);
GO

-- Creating foreign key on [Membres_idMembre] in table 'CoursCompleteJeu'
ALTER TABLE [dbo].[CoursCompleteJeu]
ADD CONSTRAINT [FK_CoursCompleteMembres]
    FOREIGN KEY ([Membres_idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursCompleteMembres'
CREATE INDEX [IX_FK_CoursCompleteMembres]
ON [dbo].[CoursCompleteJeu]
    ([Membres_idMembre]);
GO

-- Creating foreign key on [Cours_idCours] in table 'CoursCompleteJeu'
ALTER TABLE [dbo].[CoursCompleteJeu]
ADD CONSTRAINT [FK_CoursCoursComplete]
    FOREIGN KEY ([Cours_idCours])
    REFERENCES [dbo].[CoursJeu]
        ([idCours])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursCoursComplete'
CREATE INDEX [IX_FK_CoursCoursComplete]
ON [dbo].[CoursCompleteJeu]
    ([Cours_idCours]);
GO

-- Creating foreign key on [Animateur_idMembre] in table 'CoursJeu'
ALTER TABLE [dbo].[CoursJeu]
ADD CONSTRAINT [FK_AnimateurCours]
    FOREIGN KEY ([Animateur_idMembre])
    REFERENCES [dbo].[MembresJeu_Animateur]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AnimateurCours'
CREATE INDEX [IX_FK_AnimateurCours]
ON [dbo].[CoursJeu]
    ([Animateur_idMembre]);
GO

-- Creating foreign key on [Cours_idCours] in table 'GroupeJeu'
ALTER TABLE [dbo].[GroupeJeu]
ADD CONSTRAINT [FK_CoursGroupe]
    FOREIGN KEY ([Cours_idCours])
    REFERENCES [dbo].[CoursJeu]
        ([idCours])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursGroupe'
CREATE INDEX [IX_FK_CoursGroupe]
ON [dbo].[GroupeJeu]
    ([Cours_idCours]);
GO

-- Creating foreign key on [Cours_idCours] in table 'ListeAttenteJeu'
ALTER TABLE [dbo].[ListeAttenteJeu]
ADD CONSTRAINT [FK_CoursListeAttente]
    FOREIGN KEY ([Cours_idCours])
    REFERENCES [dbo].[CoursJeu]
        ([idCours])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CoursListeAttente'
CREATE INDEX [IX_FK_CoursListeAttente]
ON [dbo].[ListeAttenteJeu]
    ([Cours_idCours]);
GO

-- Creating foreign key on [GroupeJeu_idGroupe] in table 'HoraireJeu'
ALTER TABLE [dbo].[HoraireJeu]
ADD CONSTRAINT [FK_GroupeJeuHoraire]
    FOREIGN KEY ([GroupeJeu_idGroupe])
    REFERENCES [dbo].[GroupeJeu]
        ([idGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupeJeuHoraire'
CREATE INDEX [IX_FK_GroupeJeuHoraire]
ON [dbo].[HoraireJeu]
    ([GroupeJeu_idGroupe]);
GO

-- Creating foreign key on [GroupeJeu_idGroupe] in table 'ItemPanierJeu'
ALTER TABLE [dbo].[ItemPanierJeu]
ADD CONSTRAINT [FK_ItemPanierGroupeJeu]
    FOREIGN KEY ([GroupeJeu_idGroupe])
    REFERENCES [dbo].[GroupeJeu]
        ([idGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ItemPanierGroupeJeu'
CREATE INDEX [IX_FK_ItemPanierGroupeJeu]
ON [dbo].[ItemPanierJeu]
    ([GroupeJeu_idGroupe]);
GO

-- Creating foreign key on [JourSemaine_idSemaine] in table 'HoraireJeu'
ALTER TABLE [dbo].[HoraireJeu]
ADD CONSTRAINT [FK_JourSemaineHoraireJeu]
    FOREIGN KEY ([JourSemaine_idSemaine])
    REFERENCES [dbo].[JourSemaineJeu]
        ([idSemaine])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_JourSemaineHoraireJeu'
CREATE INDEX [IX_FK_JourSemaineHoraireJeu]
ON [dbo].[HoraireJeu]
    ([JourSemaine_idSemaine]);
GO

-- Creating foreign key on [MembresJeu_idMembre] in table 'ItemPanierJeu'
ALTER TABLE [dbo].[ItemPanierJeu]
ADD CONSTRAINT [FK_ItemPanierMembresJeu]
    FOREIGN KEY ([MembresJeu_idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ItemPanierMembresJeu'
CREATE INDEX [IX_FK_ItemPanierMembresJeu]
ON [dbo].[ItemPanierJeu]
    ([MembresJeu_idMembre]);
GO

-- Creating foreign key on [Panier_idCommande] in table 'ItemPanierJeu'
ALTER TABLE [dbo].[ItemPanierJeu]
ADD CONSTRAINT [FK_PanierItemPanier]
    FOREIGN KEY ([Panier_idCommande])
    REFERENCES [dbo].[PanierJeu]
        ([idCommande])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PanierItemPanier'
CREATE INDEX [IX_FK_PanierItemPanier]
ON [dbo].[ItemPanierJeu]
    ([Panier_idCommande]);
GO

-- Creating foreign key on [Membres_idMembre] in table 'ListeAttenteJeu'
ALTER TABLE [dbo].[ListeAttenteJeu]
ADD CONSTRAINT [FK_ListeAttenteMembres]
    FOREIGN KEY ([Membres_idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ListeAttenteMembres'
CREATE INDEX [IX_FK_ListeAttenteMembres]
ON [dbo].[ListeAttenteJeu]
    ([Membres_idMembre]);
GO

-- Creating foreign key on [idMembre] in table 'MembresJeu_Animateur'
ALTER TABLE [dbo].[MembresJeu_Animateur]
ADD CONSTRAINT [FK_Animateur_inherits_Membres]
    FOREIGN KEY ([idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MembresJeu_idMembre] in table 'PanierJeu'
ALTER TABLE [dbo].[PanierJeu]
ADD CONSTRAINT [FK_MembresJeuPanier]
    FOREIGN KEY ([MembresJeu_idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MembresJeuPanier'
CREATE INDEX [IX_FK_MembresJeuPanier]
ON [dbo].[PanierJeu]
    ([MembresJeu_idMembre]);
GO

-- Creating foreign key on [RoleJeu_idRole] in table 'MembresJeu'
ALTER TABLE [dbo].[MembresJeu]
ADD CONSTRAINT [FK_RoleJeuMembresJeu]
    FOREIGN KEY ([RoleJeu_idRole])
    REFERENCES [dbo].[RoleJeu]
        ([idRole])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleJeuMembresJeu'
CREATE INDEX [IX_FK_RoleJeuMembresJeu]
ON [dbo].[MembresJeu]
    ([RoleJeu_idRole]);
GO

-- Creating foreign key on [GroupeJeu_idGroupe] in table 'SessionGroupe'
ALTER TABLE [dbo].[SessionGroupe]
ADD CONSTRAINT [FK_SessionGroupe_GroupeJeu]
    FOREIGN KEY ([GroupeJeu_idGroupe])
    REFERENCES [dbo].[GroupeJeu]
        ([idGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SessionJeu_idSession] in table 'SessionGroupe'
ALTER TABLE [dbo].[SessionGroupe]
ADD CONSTRAINT [FK_SessionGroupe_SessionJeu]
    FOREIGN KEY ([SessionJeu_idSession])
    REFERENCES [dbo].[SessionJeu]
        ([idSession])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SessionGroupe_SessionJeu'
CREATE INDEX [IX_FK_SessionGroupe_SessionJeu]
ON [dbo].[SessionGroupe]
    ([SessionJeu_idSession]);
GO

-- Creating foreign key on [MembresJeu_Animateur_idMembre] in table 'SpecialiteAnimateur'
ALTER TABLE [dbo].[SpecialiteAnimateur]
ADD CONSTRAINT [FK_SpecialiteAnimateur_MembresJeu_Animateur]
    FOREIGN KEY ([MembresJeu_Animateur_idMembre])
    REFERENCES [dbo].[MembresJeu_Animateur]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SpecialiteJeu_idSpecialite] in table 'SpecialiteAnimateur'
ALTER TABLE [dbo].[SpecialiteAnimateur]
ADD CONSTRAINT [FK_SpecialiteAnimateur_SpecialiteJeu]
    FOREIGN KEY ([SpecialiteJeu_idSpecialite])
    REFERENCES [dbo].[SpecialiteJeu]
        ([idSpecialite])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialiteAnimateur_SpecialiteJeu'
CREATE INDEX [IX_FK_SpecialiteAnimateur_SpecialiteJeu]
ON [dbo].[SpecialiteAnimateur]
    ([SpecialiteJeu_idSpecialite]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------