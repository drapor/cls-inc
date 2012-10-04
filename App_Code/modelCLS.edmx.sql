
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/04/2012 14:31:53
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
IF OBJECT_ID(N'[dbo].[FK_Admin_inherits_Employe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MembresJeu_Admin] DROP CONSTRAINT [FK_Admin_inherits_Employe];
GO
IF OBJECT_ID(N'[dbo].[FK_Animateur_inherits_Membres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MembresJeu_Animateur] DROP CONSTRAINT [FK_Animateur_inherits_Membres];
GO
IF OBJECT_ID(N'[dbo].[FK_AnimateurCours]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CoursJeu] DROP CONSTRAINT [FK_AnimateurCours];
GO
IF OBJECT_ID(N'[dbo].[FK_CarteCreditMembres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CarteCreditJeu] DROP CONSTRAINT [FK_CarteCreditMembres];
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
IF OBJECT_ID(N'[dbo].[FK_Employe_inherits_Membres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MembresJeu_Employe] DROP CONSTRAINT [FK_Employe_inherits_Membres];
GO
IF OBJECT_ID(N'[dbo].[FK_HoraireGroupe]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HoraireJeu] DROP CONSTRAINT [FK_HoraireGroupe];
GO
IF OBJECT_ID(N'[dbo].[FK_ListeAttenteMembres]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ListeAttenteJeu] DROP CONSTRAINT [FK_ListeAttenteMembres];
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
IF OBJECT_ID(N'[dbo].[CarteCreditJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CarteCreditJeu];
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
IF OBJECT_ID(N'[dbo].[ListeAttenteJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ListeAttenteJeu];
GO
IF OBJECT_ID(N'[dbo].[MembresJeu]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembresJeu];
GO
IF OBJECT_ID(N'[dbo].[MembresJeu_Admin]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembresJeu_Admin];
GO
IF OBJECT_ID(N'[dbo].[MembresJeu_Animateur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembresJeu_Animateur];
GO
IF OBJECT_ID(N'[dbo].[MembresJeu_Employe]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MembresJeu_Employe];
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
    [idAbonnement] smallint  NOT NULL,
    [Membres_idMembre] smallint  NOT NULL,
    [Groupe_idGroupe] smallint  NOT NULL
);
GO

-- Creating table 'CarteCreditJeu'
CREATE TABLE [dbo].[CarteCreditJeu] (
    [noCarte] int IDENTITY(1,1) NOT NULL,
    [cvv] smallint  NOT NULL,
    [type] nvarchar(20)  NOT NULL,
    [moisExpiration] smallint  NOT NULL,
    [anneeExpiration] smallint  NOT NULL,
    [nomTitulaire] nvarchar(50)  NOT NULL,
    [Membres_idMembre] smallint  NOT NULL
);
GO

-- Creating table 'CoursCompleteJeu'
CREATE TABLE [dbo].[CoursCompleteJeu] (
    [idCoursComplete] smallint  NOT NULL,
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
    [tarifAdulte] decimal(18,0)  NOT NULL,
    [tarifEnfant] decimal(18,0)  NOT NULL,
    [groupeAge] nvarchar(4)  NOT NULL,
    [dateDebutInscription] datetime  NOT NULL,
    [dateFinInscription] datetime  NOT NULL,
    [dateDebutCours] datetime  NOT NULL,
    [dateFinCours] datetime  NOT NULL,
    [Animateur_idMembre] smallint  NOT NULL
);
GO

-- Creating table 'GroupeJeu'
CREATE TABLE [dbo].[GroupeJeu] (
    [idGroupe] smallint IDENTITY(1,1) NOT NULL,
    [nomGroupe] nvarchar(20)  NOT NULL,
    [nbMax] smallint  NOT NULL,
    [Cours_idCours] smallint  NOT NULL
);
GO

-- Creating table 'HoraireJeu'
CREATE TABLE [dbo].[HoraireJeu] (
    [idHoraire] smallint IDENTITY(1,1) NOT NULL,
    [jourSemaine] nvarchar(8)  NOT NULL,
    [heureDebut] datetime  NOT NULL,
    [heureFin] datetime  NOT NULL,
    [noLocal] nvarchar(10)  NOT NULL,
    [Groupe_idGroupe] smallint  NOT NULL
);
GO

-- Creating table 'ListeAttenteJeu'
CREATE TABLE [dbo].[ListeAttenteJeu] (
    [idListeAttente] smallint  NOT NULL,
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

-- Creating table 'MembresJeu_Admin'
CREATE TABLE [dbo].[MembresJeu_Admin] (
    [idAdmin] smallint IDENTITY(1,1) NOT NULL,
    [idMembre] smallint  NOT NULL
);
GO

-- Creating table 'MembresJeu_Animateur'
CREATE TABLE [dbo].[MembresJeu_Animateur] (
    [idAnimateur] smallint IDENTITY(1,1) NOT NULL,
    [idMembre] smallint  NOT NULL
);
GO

-- Creating table 'MembresJeu_Employe'
CREATE TABLE [dbo].[MembresJeu_Employe] (
    [idEmploye] smallint IDENTITY(1,1) NOT NULL,
    [idMembre] smallint  NOT NULL
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
    [idSpacialite] smallint IDENTITY(1,1) NOT NULL,
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
    [tarifNouveauMembre] decimal(18,0) IDENTITY(1,1) NOT NULL,
    [rabais1Enfant] decimal(18,0)  NOT NULL,
    [rabais2Enfant] decimal(18,0)  NOT NULL,
    [rabais3Enfant] decimal(18,0)  NOT NULL,
    [idTarif] smallint  NOT NULL
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
    [SpecialiteJeu_idSpacialite] smallint  NOT NULL
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

-- Creating primary key on [noCarte] in table 'CarteCreditJeu'
ALTER TABLE [dbo].[CarteCreditJeu]
ADD CONSTRAINT [PK_CarteCreditJeu]
    PRIMARY KEY CLUSTERED ([noCarte] ASC);
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

-- Creating primary key on [idMembre] in table 'MembresJeu_Admin'
ALTER TABLE [dbo].[MembresJeu_Admin]
ADD CONSTRAINT [PK_MembresJeu_Admin]
    PRIMARY KEY CLUSTERED ([idMembre] ASC);
GO

-- Creating primary key on [idMembre] in table 'MembresJeu_Animateur'
ALTER TABLE [dbo].[MembresJeu_Animateur]
ADD CONSTRAINT [PK_MembresJeu_Animateur]
    PRIMARY KEY CLUSTERED ([idMembre] ASC);
GO

-- Creating primary key on [idMembre] in table 'MembresJeu_Employe'
ALTER TABLE [dbo].[MembresJeu_Employe]
ADD CONSTRAINT [PK_MembresJeu_Employe]
    PRIMARY KEY CLUSTERED ([idMembre] ASC);
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

-- Creating primary key on [idSpacialite] in table 'SpecialiteJeu'
ALTER TABLE [dbo].[SpecialiteJeu]
ADD CONSTRAINT [PK_SpecialiteJeu]
    PRIMARY KEY CLUSTERED ([idSpacialite] ASC);
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

-- Creating primary key on [MembresJeu_Animateur_idMembre], [SpecialiteJeu_idSpacialite] in table 'SpecialiteAnimateur'
ALTER TABLE [dbo].[SpecialiteAnimateur]
ADD CONSTRAINT [PK_SpecialiteAnimateur]
    PRIMARY KEY NONCLUSTERED ([MembresJeu_Animateur_idMembre], [SpecialiteJeu_idSpacialite] ASC);
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

-- Creating foreign key on [Membres_idMembre] in table 'CarteCreditJeu'
ALTER TABLE [dbo].[CarteCreditJeu]
ADD CONSTRAINT [FK_CarteCreditMembres]
    FOREIGN KEY ([Membres_idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CarteCreditMembres'
CREATE INDEX [IX_FK_CarteCreditMembres]
ON [dbo].[CarteCreditJeu]
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

-- Creating foreign key on [Groupe_idGroupe] in table 'HoraireJeu'
ALTER TABLE [dbo].[HoraireJeu]
ADD CONSTRAINT [FK_HoraireGroupe]
    FOREIGN KEY ([Groupe_idGroupe])
    REFERENCES [dbo].[GroupeJeu]
        ([idGroupe])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HoraireGroupe'
CREATE INDEX [IX_FK_HoraireGroupe]
ON [dbo].[HoraireJeu]
    ([Groupe_idGroupe]);
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

-- Creating foreign key on [idMembre] in table 'MembresJeu_Employe'
ALTER TABLE [dbo].[MembresJeu_Employe]
ADD CONSTRAINT [FK_Employe_inherits_Membres]
    FOREIGN KEY ([idMembre])
    REFERENCES [dbo].[MembresJeu]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [idMembre] in table 'MembresJeu_Admin'
ALTER TABLE [dbo].[MembresJeu_Admin]
ADD CONSTRAINT [FK_Admin_inherits_Employe]
    FOREIGN KEY ([idMembre])
    REFERENCES [dbo].[MembresJeu_Employe]
        ([idMembre])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
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

-- Creating foreign key on [SpecialiteJeu_idSpacialite] in table 'SpecialiteAnimateur'
ALTER TABLE [dbo].[SpecialiteAnimateur]
ADD CONSTRAINT [FK_SpecialiteAnimateur_SpecialiteJeu]
    FOREIGN KEY ([SpecialiteJeu_idSpacialite])
    REFERENCES [dbo].[SpecialiteJeu]
        ([idSpacialite])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SpecialiteAnimateur_SpecialiteJeu'
CREATE INDEX [IX_FK_SpecialiteAnimateur_SpecialiteJeu]
ON [dbo].[SpecialiteAnimateur]
    ([SpecialiteJeu_idSpacialite]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------