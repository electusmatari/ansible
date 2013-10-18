--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: ccp; Type: SCHEMA; Schema: -; Owner: emtools
--

CREATE SCHEMA ccp;


ALTER SCHEMA ccp OWNER TO emtools;

SET search_path = ccp, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agtagents; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE agtagents (
    agentid integer NOT NULL,
    divisionid smallint,
    corporationid integer,
    locationid integer,
    level smallint,
    quality smallint,
    agenttypeid integer,
    islocator smallint,
    CONSTRAINT agtagents_divisionid_check CHECK ((divisionid >= 0)),
    CONSTRAINT agtagents_level_check CHECK ((level >= 0))
);


ALTER TABLE ccp.agtagents OWNER TO emtools;

--
-- Name: agtagenttypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE agtagenttypes (
    agenttypeid integer NOT NULL,
    agenttype character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE ccp.agtagenttypes OWNER TO emtools;

--
-- Name: agtresearchagents; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE agtresearchagents (
    agentid integer NOT NULL,
    typeid integer NOT NULL
);


ALTER TABLE ccp.agtresearchagents OWNER TO emtools;

--
-- Name: chrancestries; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE chrancestries (
    ancestryid smallint NOT NULL,
    ancestryname character varying(200) DEFAULT NULL::character varying,
    bloodlineid smallint,
    description character varying(2000) DEFAULT NULL::character varying,
    perception smallint,
    willpower smallint,
    charisma smallint,
    memory smallint,
    intelligence smallint,
    iconid integer,
    shortdescription character varying(1000) DEFAULT NULL::character varying,
    CONSTRAINT chrancestries_ancestryid_check CHECK ((ancestryid >= 0)),
    CONSTRAINT chrancestries_bloodlineid_check CHECK ((bloodlineid >= 0)),
    CONSTRAINT chrancestries_charisma_check CHECK ((charisma >= 0)),
    CONSTRAINT chrancestries_intelligence_check CHECK ((intelligence >= 0)),
    CONSTRAINT chrancestries_memory_check CHECK ((memory >= 0)),
    CONSTRAINT chrancestries_perception_check CHECK ((perception >= 0)),
    CONSTRAINT chrancestries_willpower_check CHECK ((willpower >= 0))
);


ALTER TABLE ccp.chrancestries OWNER TO emtools;

--
-- Name: chrattributes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE chrattributes (
    attributeid smallint NOT NULL,
    attributename character varying(100) DEFAULT NULL::character varying,
    description character varying(1000) DEFAULT NULL::character varying,
    iconid integer,
    shortdescription character varying(1000) DEFAULT NULL::character varying,
    notes character varying(1000) DEFAULT NULL::character varying,
    CONSTRAINT chrattributes_attributeid_check CHECK ((attributeid >= 0))
);


ALTER TABLE ccp.chrattributes OWNER TO emtools;

--
-- Name: chrbloodlines; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE chrbloodlines (
    bloodlineid smallint NOT NULL,
    bloodlinename character varying(200) DEFAULT NULL::character varying,
    raceid smallint,
    description character varying(2000) DEFAULT NULL::character varying,
    maledescription character varying(2000) DEFAULT NULL::character varying,
    femaledescription character varying(2000) DEFAULT NULL::character varying,
    shiptypeid integer,
    corporationid integer,
    perception smallint,
    willpower smallint,
    charisma smallint,
    memory smallint,
    intelligence smallint,
    iconid integer,
    shortdescription character varying(1000) DEFAULT NULL::character varying,
    shortmaledescription character varying(1000) DEFAULT NULL::character varying,
    shortfemaledescription character varying(1000) DEFAULT NULL::character varying,
    CONSTRAINT chrbloodlines_bloodlineid_check CHECK ((bloodlineid >= 0)),
    CONSTRAINT chrbloodlines_charisma_check CHECK ((charisma >= 0)),
    CONSTRAINT chrbloodlines_intelligence_check CHECK ((intelligence >= 0)),
    CONSTRAINT chrbloodlines_memory_check CHECK ((memory >= 0)),
    CONSTRAINT chrbloodlines_perception_check CHECK ((perception >= 0)),
    CONSTRAINT chrbloodlines_raceid_check CHECK ((raceid >= 0)),
    CONSTRAINT chrbloodlines_willpower_check CHECK ((willpower >= 0))
);


ALTER TABLE ccp.chrbloodlines OWNER TO emtools;

--
-- Name: chrfactions; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE chrfactions (
    factionid integer NOT NULL,
    factionname character varying(100) DEFAULT NULL::character varying,
    description character varying(1000) DEFAULT NULL::character varying,
    raceids integer,
    solarsystemid integer,
    corporationid integer,
    sizefactor double precision,
    stationcount smallint,
    stationsystemcount smallint,
    militiacorporationid integer,
    iconid integer
);


ALTER TABLE ccp.chrfactions OWNER TO emtools;

--
-- Name: chrraces; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE chrraces (
    raceid smallint NOT NULL,
    racename character varying(100) DEFAULT NULL::character varying,
    description character varying(1000) DEFAULT NULL::character varying,
    iconid integer,
    shortdescription character varying(500) DEFAULT NULL::character varying,
    CONSTRAINT chrraces_raceid_check CHECK ((raceid >= 0))
);


ALTER TABLE ccp.chrraces OWNER TO emtools;

--
-- Name: crpactivities; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crpactivities (
    activityid smallint NOT NULL,
    activityname character varying(200) DEFAULT NULL::character varying,
    description character varying(2000) DEFAULT NULL::character varying,
    CONSTRAINT crpactivities_activityid_check CHECK ((activityid >= 0))
);


ALTER TABLE ccp.crpactivities OWNER TO emtools;

--
-- Name: crpnpccorporationdivisions; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crpnpccorporationdivisions (
    corporationid integer NOT NULL,
    divisionid smallint NOT NULL,
    size smallint,
    CONSTRAINT crpnpccorporationdivisions_divisionid_check CHECK ((divisionid >= 0)),
    CONSTRAINT crpnpccorporationdivisions_size_check CHECK ((size >= 0))
);


ALTER TABLE ccp.crpnpccorporationdivisions OWNER TO emtools;

--
-- Name: crpnpccorporationresearchfields; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crpnpccorporationresearchfields (
    skillid integer NOT NULL,
    corporationid integer NOT NULL
);


ALTER TABLE ccp.crpnpccorporationresearchfields OWNER TO emtools;

--
-- Name: crpnpccorporations; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crpnpccorporations (
    corporationid integer NOT NULL,
    size character(1) DEFAULT NULL::bpchar,
    extent character(1) DEFAULT NULL::bpchar,
    solarsystemid integer,
    investorid1 integer,
    investorshares1 smallint,
    investorid2 integer,
    investorshares2 smallint,
    investorid3 integer,
    investorshares3 smallint,
    investorid4 integer,
    investorshares4 smallint,
    friendid integer,
    enemyid integer,
    publicshares bigint,
    initialprice integer,
    minsecurity double precision,
    scattered smallint,
    fringe smallint,
    corridor smallint,
    hub smallint,
    border smallint,
    factionid integer,
    sizefactor double precision,
    stationcount smallint,
    stationsystemcount smallint,
    description character varying(8000) DEFAULT NULL::character varying,
    iconid integer,
    CONSTRAINT crpnpccorporations_border_check CHECK ((border >= 0)),
    CONSTRAINT crpnpccorporations_corridor_check CHECK ((corridor >= 0)),
    CONSTRAINT crpnpccorporations_fringe_check CHECK ((fringe >= 0)),
    CONSTRAINT crpnpccorporations_hub_check CHECK ((hub >= 0)),
    CONSTRAINT crpnpccorporations_investorshares1_check CHECK ((investorshares1 >= 0)),
    CONSTRAINT crpnpccorporations_investorshares2_check CHECK ((investorshares2 >= 0)),
    CONSTRAINT crpnpccorporations_investorshares3_check CHECK ((investorshares3 >= 0)),
    CONSTRAINT crpnpccorporations_investorshares4_check CHECK ((investorshares4 >= 0))
);


ALTER TABLE ccp.crpnpccorporations OWNER TO emtools;

--
-- Name: crpnpccorporationtrades; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crpnpccorporationtrades (
    corporationid integer NOT NULL,
    typeid integer NOT NULL
);


ALTER TABLE ccp.crpnpccorporationtrades OWNER TO emtools;

--
-- Name: crpnpcdivisions; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crpnpcdivisions (
    divisionid smallint NOT NULL,
    divisionname character varying(200) DEFAULT NULL::character varying,
    description character varying(2000) DEFAULT NULL::character varying,
    leadertype character varying(200) DEFAULT NULL::character varying,
    CONSTRAINT crpnpcdivisions_divisionid_check CHECK ((divisionid >= 0))
);


ALTER TABLE ccp.crpnpcdivisions OWNER TO emtools;

--
-- Name: crtcategories; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crtcategories (
    categoryid smallint NOT NULL,
    description character varying(1000) DEFAULT NULL::character varying,
    categoryname character varying(512) DEFAULT NULL::character varying,
    CONSTRAINT crtcategories_categoryid_check CHECK ((categoryid >= 0))
);


ALTER TABLE ccp.crtcategories OWNER TO emtools;

--
-- Name: crtcertificates; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crtcertificates (
    certificateid integer NOT NULL,
    categoryid smallint,
    classid integer,
    grade smallint,
    corpid integer,
    iconid integer,
    description character varying(1000) DEFAULT NULL::character varying,
    CONSTRAINT crtcertificates_categoryid_check CHECK ((categoryid >= 0)),
    CONSTRAINT crtcertificates_grade_check CHECK ((grade >= 0))
);


ALTER TABLE ccp.crtcertificates OWNER TO emtools;

--
-- Name: crtclasses; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crtclasses (
    classid integer NOT NULL,
    description character varying(1000) DEFAULT NULL::character varying,
    classname character varying(512) DEFAULT NULL::character varying
);


ALTER TABLE ccp.crtclasses OWNER TO emtools;

--
-- Name: crtrecommendations; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crtrecommendations (
    recommendationid integer NOT NULL,
    shiptypeid integer,
    certificateid integer,
    recommendationlevel smallint DEFAULT (0)::smallint NOT NULL,
    CONSTRAINT crtrecommendations_recommendationlevel_check CHECK ((recommendationlevel >= 0))
);


ALTER TABLE ccp.crtrecommendations OWNER TO emtools;

--
-- Name: crtrelationships; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE crtrelationships (
    relationshipid integer NOT NULL,
    parentid integer,
    parenttypeid integer,
    parentlevel smallint,
    childid integer,
    CONSTRAINT crtrelationships_parentlevel_check CHECK ((parentlevel >= 0))
);


ALTER TABLE ccp.crtrelationships OWNER TO emtools;

--
-- Name: dgmattributecategories; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE dgmattributecategories (
    categoryid smallint NOT NULL,
    categoryname character varying(100) DEFAULT NULL::character varying,
    categorydescription character varying(400) DEFAULT NULL::character varying,
    CONSTRAINT dgmattributecategories_categoryid_check CHECK ((categoryid >= 0))
);


ALTER TABLE ccp.dgmattributecategories OWNER TO emtools;

--
-- Name: dgmattributetypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE dgmattributetypes (
    attributeid smallint NOT NULL,
    attributename character varying(100) DEFAULT NULL::character varying,
    description character varying(1000) DEFAULT NULL::character varying,
    iconid integer,
    defaultvalue double precision,
    published smallint,
    displayname character varying(100) DEFAULT NULL::character varying,
    unitid smallint,
    stackable smallint,
    highisgood smallint,
    categoryid smallint,
    CONSTRAINT dgmattributetypes_categoryid_check CHECK ((categoryid >= 0)),
    CONSTRAINT dgmattributetypes_unitid_check CHECK ((unitid >= 0))
);


ALTER TABLE ccp.dgmattributetypes OWNER TO emtools;

--
-- Name: dgmeffects; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE dgmeffects (
    effectid smallint NOT NULL,
    effectname character varying(400) DEFAULT NULL::character varying,
    effectcategory smallint,
    preexpression integer,
    postexpression integer,
    description character varying(1000) DEFAULT NULL::character varying,
    guid character varying(60) DEFAULT NULL::character varying,
    iconid integer,
    isoffensive smallint,
    isassistance smallint,
    durationattributeid smallint,
    trackingspeedattributeid smallint,
    dischargeattributeid smallint,
    rangeattributeid smallint,
    falloffattributeid smallint,
    disallowautorepeat smallint,
    published smallint,
    displayname character varying(100) DEFAULT NULL::character varying,
    iswarpsafe smallint,
    rangechance smallint,
    electronicchance smallint,
    propulsionchance smallint,
    distribution smallint,
    sfxname character varying(20) DEFAULT NULL::character varying,
    npcusagechanceattributeid smallint,
    npcactivationchanceattributeid smallint,
    fittingusagechanceattributeid smallint,
    CONSTRAINT dgmeffects_distribution_check CHECK ((distribution >= 0))
);


ALTER TABLE ccp.dgmeffects OWNER TO emtools;

--
-- Name: dgmtypeattributes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE dgmtypeattributes (
    typeid integer NOT NULL,
    attributeid smallint NOT NULL,
    valueint integer,
    valuefloat double precision
);


ALTER TABLE ccp.dgmtypeattributes OWNER TO emtools;

--
-- Name: dgmtypeeffects; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE dgmtypeeffects (
    typeid integer NOT NULL,
    effectid smallint NOT NULL,
    isdefault smallint
);


ALTER TABLE ccp.dgmtypeeffects OWNER TO emtools;

--
-- Name: eveunits; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE eveunits (
    unitid smallint NOT NULL,
    unitname character varying(100) DEFAULT NULL::character varying,
    displayname character varying(50) DEFAULT NULL::character varying,
    description character varying(1000) DEFAULT NULL::character varying,
    CONSTRAINT eveunits_unitid_check CHECK ((unitid >= 0))
);


ALTER TABLE ccp.eveunits OWNER TO emtools;

--
-- Name: invblueprinttypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invblueprinttypes (
    blueprinttypeid integer NOT NULL,
    parentblueprinttypeid integer,
    producttypeid integer,
    productiontime integer,
    techlevel smallint,
    researchproductivitytime integer,
    researchmaterialtime integer,
    researchcopytime integer,
    researchtechtime integer,
    productivitymodifier integer,
    materialmodifier smallint,
    wastefactor smallint,
    maxproductionlimit integer
);


ALTER TABLE ccp.invblueprinttypes OWNER TO emtools;

--
-- Name: invcategories; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invcategories (
    categoryid integer NOT NULL,
    categoryname character varying(200) DEFAULT NULL::character varying,
    description character varying(6000) DEFAULT NULL::character varying,
    iconid integer,
    published smallint
);


ALTER TABLE ccp.invcategories OWNER TO emtools;

--
-- Name: invcontrabandtypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invcontrabandtypes (
    factionid integer NOT NULL,
    typeid integer NOT NULL,
    standingloss double precision,
    confiscateminsec double precision,
    finebyvalue double precision,
    attackminsec double precision
);


ALTER TABLE ccp.invcontrabandtypes OWNER TO emtools;

--
-- Name: invcontroltowerresourcepurposes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invcontroltowerresourcepurposes (
    purpose smallint NOT NULL,
    purposetext character varying(100) DEFAULT NULL::character varying,
    CONSTRAINT invcontroltowerresourcepurposes_purpose_check CHECK ((purpose >= 0))
);


ALTER TABLE ccp.invcontroltowerresourcepurposes OWNER TO emtools;

--
-- Name: invcontroltowerresources; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invcontroltowerresources (
    controltowertypeid integer NOT NULL,
    resourcetypeid integer NOT NULL,
    purpose smallint,
    quantity integer,
    minsecuritylevel double precision,
    factionid integer,
    CONSTRAINT invcontroltowerresources_purpose_check CHECK ((purpose >= 0))
);


ALTER TABLE ccp.invcontroltowerresources OWNER TO emtools;

--
-- Name: invflags; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invflags (
    flagid smallint NOT NULL,
    flagname character varying(200) DEFAULT NULL::character varying,
    flagtext character varying(100) DEFAULT NULL::character varying,
    orderid integer
);


ALTER TABLE ccp.invflags OWNER TO emtools;

--
-- Name: invgroups; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invgroups (
    groupid integer NOT NULL,
    categoryid integer,
    groupname character varying(200) DEFAULT NULL::character varying,
    description character varying(6000) DEFAULT NULL::character varying,
    iconid integer,
    usebaseprice smallint,
    allowmanufacture smallint,
    allowrecycler smallint,
    anchored smallint,
    anchorable smallint,
    fittablenonsingleton smallint,
    published smallint
);


ALTER TABLE ccp.invgroups OWNER TO emtools;

--
-- Name: invitems; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invitems (
    itemid bigint NOT NULL,
    typeid integer NOT NULL,
    ownerid integer NOT NULL,
    locationid bigint NOT NULL,
    flagid smallint NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE ccp.invitems OWNER TO emtools;

--
-- Name: invmarketgroups; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invmarketgroups (
    marketgroupid integer NOT NULL,
    parentgroupid integer,
    marketgroupname character varying(200) DEFAULT NULL::character varying,
    description character varying(6000) DEFAULT NULL::character varying,
    iconid integer,
    hastypes smallint
);


ALTER TABLE ccp.invmarketgroups OWNER TO emtools;

--
-- Name: invmetagroups; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invmetagroups (
    metagroupid smallint NOT NULL,
    metagroupname character varying(200) DEFAULT NULL::character varying,
    description character varying(2000) DEFAULT NULL::character varying,
    iconid integer
);


ALTER TABLE ccp.invmetagroups OWNER TO emtools;

--
-- Name: invmetatypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invmetatypes (
    typeid integer NOT NULL,
    parenttypeid integer,
    metagroupid smallint
);


ALTER TABLE ccp.invmetatypes OWNER TO emtools;

--
-- Name: invnames; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invnames (
    itemid bigint NOT NULL,
    itemname character varying(400) NOT NULL
);


ALTER TABLE ccp.invnames OWNER TO emtools;

--
-- Name: invpositions; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invpositions (
    itemid bigint NOT NULL,
    x double precision DEFAULT (0)::double precision NOT NULL,
    y double precision DEFAULT (0)::double precision NOT NULL,
    z double precision DEFAULT (0)::double precision NOT NULL,
    yaw double precision,
    pitch double precision,
    roll double precision
);


ALTER TABLE ccp.invpositions OWNER TO emtools;

--
-- Name: invtypematerials; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invtypematerials (
    typeid integer NOT NULL,
    materialtypeid integer NOT NULL,
    quantity integer DEFAULT 0 NOT NULL
);


ALTER TABLE ccp.invtypematerials OWNER TO emtools;

--
-- Name: invtypereactions; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invtypereactions (
    reactiontypeid integer NOT NULL,
    input smallint NOT NULL,
    typeid integer NOT NULL,
    quantity smallint
);


ALTER TABLE ccp.invtypereactions OWNER TO emtools;

--
-- Name: invtypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invtypes (
    typeid integer NOT NULL,
    groupid integer,
    typename character varying(200) DEFAULT NULL::character varying,
    description character varying(6000) DEFAULT NULL::character varying,
    mass double precision,
    volume double precision,
    capacity double precision,
    portionsize integer,
    raceid smallint,
    baseprice numeric(19,4) DEFAULT NULL::numeric,
    published smallint,
    marketgroupid integer,
    chanceofduplicating double precision,
    CONSTRAINT invtypes_raceid_check CHECK ((raceid >= 0))
);


ALTER TABLE ccp.invtypes OWNER TO emtools;

--
-- Name: invuniquenames; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE invuniquenames (
    itemid integer NOT NULL,
    itemname character varying(400) NOT NULL,
    groupid integer
);


ALTER TABLE ccp.invuniquenames OWNER TO emtools;

--
-- Name: mapcelestialstatistics; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapcelestialstatistics (
    celestialid integer NOT NULL,
    temperature double precision,
    spectralclass character varying(10) DEFAULT NULL::character varying,
    luminosity double precision,
    age double precision,
    life double precision,
    orbitradius double precision,
    eccentricity double precision,
    massdust double precision,
    massgas double precision,
    fragmented smallint,
    density double precision,
    surfacegravity double precision,
    escapevelocity double precision,
    orbitperiod double precision,
    rotationrate double precision,
    locked smallint,
    pressure double precision,
    radius double precision,
    mass double precision
);


ALTER TABLE ccp.mapcelestialstatistics OWNER TO emtools;

--
-- Name: mapconstellationjumps; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapconstellationjumps (
    fromregionid integer,
    fromconstellationid integer NOT NULL,
    toconstellationid integer NOT NULL,
    toregionid integer
);


ALTER TABLE ccp.mapconstellationjumps OWNER TO emtools;

--
-- Name: mapconstellations; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapconstellations (
    regionid integer,
    constellationid integer NOT NULL,
    constellationname character varying(200) DEFAULT NULL::character varying,
    x double precision,
    y double precision,
    z double precision,
    "xMin" double precision,
    "xMax" double precision,
    ymin double precision,
    ymax double precision,
    zmin double precision,
    zmax double precision,
    factionid integer,
    radius double precision
);


ALTER TABLE ccp.mapconstellations OWNER TO emtools;

--
-- Name: mapdenormalize; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapdenormalize (
    itemid integer NOT NULL,
    typeid integer,
    groupid integer,
    solarsystemid integer,
    constellationid integer,
    regionid integer,
    orbitid integer,
    x double precision,
    y double precision,
    z double precision,
    radius double precision,
    itemname character varying(200) DEFAULT NULL::character varying,
    security double precision,
    celestialindex smallint,
    orbitindex smallint,
    CONSTRAINT mapdenormalize_celestialindex_check CHECK ((celestialindex >= 0)),
    CONSTRAINT mapdenormalize_orbitindex_check CHECK ((orbitindex >= 0))
);


ALTER TABLE ccp.mapdenormalize OWNER TO emtools;

--
-- Name: mapjumps; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapjumps (
    stargateid integer NOT NULL,
    celestialid integer
);


ALTER TABLE ccp.mapjumps OWNER TO emtools;

--
-- Name: maplandmarks; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE maplandmarks (
    landmarkid smallint NOT NULL,
    landmarkname character varying(100) DEFAULT NULL::character varying,
    description character varying(7000) DEFAULT NULL::character varying,
    locationid integer,
    x double precision,
    y double precision,
    z double precision,
    radius double precision,
    iconid integer,
    importance smallint,
    CONSTRAINT maplandmarks_importance_check CHECK ((importance >= 0))
);


ALTER TABLE ccp.maplandmarks OWNER TO emtools;

--
-- Name: maplocationscenes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE maplocationscenes (
    locationid integer NOT NULL,
    graphicid integer
);


ALTER TABLE ccp.maplocationscenes OWNER TO emtools;

--
-- Name: maplocationwormholeclasses; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE maplocationwormholeclasses (
    locationid integer NOT NULL,
    wormholeclassid smallint,
    CONSTRAINT maplocationwormholeclasses_wormholeclassid_check CHECK ((wormholeclassid >= 0))
);


ALTER TABLE ccp.maplocationwormholeclasses OWNER TO emtools;

--
-- Name: mapregionjumps; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapregionjumps (
    fromregionid integer NOT NULL,
    toregionid integer NOT NULL
);


ALTER TABLE ccp.mapregionjumps OWNER TO emtools;

--
-- Name: mapregions; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapregions (
    regionid integer NOT NULL,
    regionname character varying(200) DEFAULT NULL::character varying,
    x double precision,
    y double precision,
    z double precision,
    "xMin" double precision,
    "xMax" double precision,
    ymin double precision,
    ymax double precision,
    zmin double precision,
    zmax double precision,
    factionid integer,
    radius double precision
);


ALTER TABLE ccp.mapregions OWNER TO emtools;

--
-- Name: mapsolarsystemjumps; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapsolarsystemjumps (
    fromregionid integer,
    fromconstellationid integer,
    fromsolarsystemid integer NOT NULL,
    tosolarsystemid integer NOT NULL,
    toconstellationid integer,
    toregionid integer
);


ALTER TABLE ccp.mapsolarsystemjumps OWNER TO emtools;

--
-- Name: mapsolarsystems; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapsolarsystems (
    regionid integer,
    constellationid integer,
    solarsystemid integer NOT NULL,
    solarsystemname character varying(200) DEFAULT NULL::character varying,
    x double precision,
    y double precision,
    z double precision,
    "xMin" double precision,
    "xMax" double precision,
    ymin double precision,
    ymax double precision,
    zmin double precision,
    zmax double precision,
    luminosity double precision,
    border smallint,
    fringe smallint,
    corridor smallint,
    hub smallint,
    international smallint,
    regional smallint,
    constellation smallint,
    security double precision,
    factionid integer,
    radius double precision,
    suntypeid integer,
    securityclass character varying(2) DEFAULT NULL::character varying
);


ALTER TABLE ccp.mapsolarsystems OWNER TO emtools;

--
-- Name: mapuniverse; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE mapuniverse (
    universeid integer NOT NULL,
    universename character varying(100) DEFAULT NULL::character varying,
    x double precision,
    y double precision,
    z double precision,
    "xMin" double precision,
    "xMax" double precision,
    ymin double precision,
    ymax double precision,
    zmin double precision,
    zmax double precision,
    radius double precision
);


ALTER TABLE ccp.mapuniverse OWNER TO emtools;

--
-- Name: planetschematics; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE planetschematics (
    schematicid smallint NOT NULL,
    schematicname character varying(510) DEFAULT NULL::character varying,
    cycletime integer
);


ALTER TABLE ccp.planetschematics OWNER TO emtools;

--
-- Name: planetschematicspinmap; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE planetschematicspinmap (
    schematicid smallint NOT NULL,
    pintypeid integer NOT NULL
);


ALTER TABLE ccp.planetschematicspinmap OWNER TO emtools;

--
-- Name: planetschematicstypemap; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE planetschematicstypemap (
    schematicid smallint NOT NULL,
    typeid integer NOT NULL,
    quantity smallint,
    isinput smallint
);


ALTER TABLE ccp.planetschematicstypemap OWNER TO emtools;

--
-- Name: ramactivities; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE ramactivities (
    activityid smallint NOT NULL,
    activityname character varying(200) DEFAULT NULL::character varying,
    iconno character varying(5) DEFAULT NULL::character varying,
    description character varying(2000) DEFAULT NULL::character varying,
    published smallint,
    CONSTRAINT ramactivities_activityid_check CHECK ((activityid >= 0))
);


ALTER TABLE ccp.ramactivities OWNER TO emtools;

--
-- Name: ramassemblylines; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE ramassemblylines (
    assemblylineid integer NOT NULL,
    assemblylinetypeid smallint,
    containerid integer,
    nextfreetime timestamp without time zone,
    uigroupingid smallint,
    costinstall double precision,
    costperhour double precision,
    restrictionmask smallint,
    discountpergoodstandingpoint double precision,
    surchargeperbadstandingpoint double precision,
    minimumstanding double precision,
    minimumcharsecurity double precision,
    minimumcorpsecurity double precision,
    maximumcharsecurity double precision,
    maximumcorpsecurity double precision,
    ownerid integer,
    activityid smallint,
    CONSTRAINT ramassemblylines_activityid_check CHECK ((activityid >= 0)),
    CONSTRAINT ramassemblylines_assemblylinetypeid_check CHECK ((assemblylinetypeid >= 0)),
    CONSTRAINT ramassemblylines_restrictionmask_check CHECK ((restrictionmask >= 0)),
    CONSTRAINT ramassemblylines_uigroupingid_check CHECK ((uigroupingid >= 0))
);


ALTER TABLE ccp.ramassemblylines OWNER TO emtools;

--
-- Name: ramassemblylinestations; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE ramassemblylinestations (
    stationid integer NOT NULL,
    assemblylinetypeid smallint NOT NULL,
    quantity smallint,
    stationtypeid integer,
    ownerid integer,
    solarsystemid integer,
    regionid integer,
    CONSTRAINT ramassemblylinestations_assemblylinetypeid_check CHECK ((assemblylinetypeid >= 0)),
    CONSTRAINT ramassemblylinestations_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE ccp.ramassemblylinestations OWNER TO emtools;

--
-- Name: ramassemblylinetypedetailpercategory; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE ramassemblylinetypedetailpercategory (
    assemblylinetypeid smallint NOT NULL,
    categoryid integer NOT NULL,
    timemultiplier double precision,
    materialmultiplier double precision,
    CONSTRAINT ramassemblylinetypedetailpercategory_assemblylinetypeid_check CHECK ((assemblylinetypeid >= 0))
);


ALTER TABLE ccp.ramassemblylinetypedetailpercategory OWNER TO emtools;

--
-- Name: ramassemblylinetypedetailpergroup; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE ramassemblylinetypedetailpergroup (
    assemblylinetypeid smallint NOT NULL,
    groupid integer NOT NULL,
    timemultiplier double precision,
    materialmultiplier double precision,
    CONSTRAINT ramassemblylinetypedetailpergroup_assemblylinetypeid_check CHECK ((assemblylinetypeid >= 0))
);


ALTER TABLE ccp.ramassemblylinetypedetailpergroup OWNER TO emtools;

--
-- Name: ramassemblylinetypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE ramassemblylinetypes (
    assemblylinetypeid smallint NOT NULL,
    assemblylinetypename character varying(200) DEFAULT NULL::character varying,
    description character varying(2000) DEFAULT NULL::character varying,
    basetimemultiplier double precision,
    basematerialmultiplier double precision,
    volume double precision,
    activityid smallint,
    mincostperhour double precision,
    CONSTRAINT ramassemblylinetypes_activityid_check CHECK ((activityid >= 0)),
    CONSTRAINT ramassemblylinetypes_assemblylinetypeid_check CHECK ((assemblylinetypeid >= 0))
);


ALTER TABLE ccp.ramassemblylinetypes OWNER TO emtools;

--
-- Name: raminstallationtypecontents; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE raminstallationtypecontents (
    installationtypeid integer NOT NULL,
    assemblylinetypeid smallint NOT NULL,
    quantity smallint,
    CONSTRAINT raminstallationtypecontents_assemblylinetypeid_check CHECK ((assemblylinetypeid >= 0)),
    CONSTRAINT raminstallationtypecontents_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE ccp.raminstallationtypecontents OWNER TO emtools;

--
-- Name: ramtyperequirements; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE ramtyperequirements (
    typeid integer NOT NULL,
    activityid smallint NOT NULL,
    requiredtypeid integer NOT NULL,
    quantity integer,
    damageperjob double precision,
    recycle smallint,
    CONSTRAINT ramtyperequirements_activityid_check CHECK ((activityid >= 0))
);


ALTER TABLE ccp.ramtyperequirements OWNER TO emtools;

--
-- Name: staoperations; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE staoperations (
    activityid smallint,
    operationid smallint NOT NULL,
    operationname character varying(200) DEFAULT NULL::character varying,
    description character varying(2000) DEFAULT NULL::character varying,
    fringe smallint,
    corridor smallint,
    hub smallint,
    border smallint,
    ratio smallint,
    caldaristationtypeid integer,
    minmatarstationtypeid integer,
    amarrstationtypeid integer,
    gallentestationtypeid integer,
    jovestationtypeid integer,
    CONSTRAINT staoperations_activityid_check CHECK ((activityid >= 0)),
    CONSTRAINT staoperations_border_check CHECK ((border >= 0)),
    CONSTRAINT staoperations_corridor_check CHECK ((corridor >= 0)),
    CONSTRAINT staoperations_fringe_check CHECK ((fringe >= 0)),
    CONSTRAINT staoperations_hub_check CHECK ((hub >= 0)),
    CONSTRAINT staoperations_operationid_check CHECK ((operationid >= 0)),
    CONSTRAINT staoperations_ratio_check CHECK ((ratio >= 0))
);


ALTER TABLE ccp.staoperations OWNER TO emtools;

--
-- Name: staoperationservices; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE staoperationservices (
    operationid smallint NOT NULL,
    serviceid integer NOT NULL,
    CONSTRAINT staoperationservices_operationid_check CHECK ((operationid >= 0))
);


ALTER TABLE ccp.staoperationservices OWNER TO emtools;

--
-- Name: staservices; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE staservices (
    serviceid integer NOT NULL,
    servicename character varying(200) DEFAULT NULL::character varying,
    description character varying(2000) DEFAULT NULL::character varying
);


ALTER TABLE ccp.staservices OWNER TO emtools;

--
-- Name: stastations; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE stastations (
    stationid integer NOT NULL,
    security smallint,
    dockingcostpervolume double precision,
    maxshipvolumedockable double precision,
    officerentalcost integer,
    operationid smallint,
    stationtypeid integer,
    corporationid integer,
    solarsystemid integer,
    constellationid integer,
    regionid integer,
    stationname character varying(200) DEFAULT NULL::character varying,
    x double precision,
    y double precision,
    z double precision,
    reprocessingefficiency double precision,
    reprocessingstationstake double precision,
    reprocessinghangarflag smallint,
    CONSTRAINT stastations_operationid_check CHECK ((operationid >= 0)),
    CONSTRAINT stastations_reprocessinghangarflag_check CHECK ((reprocessinghangarflag >= 0))
);


ALTER TABLE ccp.stastations OWNER TO emtools;

--
-- Name: stastationtypes; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE stastationtypes (
    stationtypeid integer NOT NULL,
    dockentryx double precision,
    dockentryy double precision,
    dockentryz double precision,
    dockorientationx double precision,
    dockorientationy double precision,
    dockorientationz double precision,
    operationid smallint,
    officeslots smallint,
    reprocessingefficiency double precision,
    conquerable smallint,
    CONSTRAINT stastationtypes_officeslots_check CHECK ((officeslots >= 0)),
    CONSTRAINT stastationtypes_operationid_check CHECK ((operationid >= 0))
);


ALTER TABLE ccp.stastationtypes OWNER TO emtools;

--
-- Name: translationtables; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE translationtables (
    sourcetable character varying(400) NOT NULL,
    destinationtable character varying(400) DEFAULT NULL::character varying,
    translatedkey character varying(400) NOT NULL,
    tcgroupid integer,
    tcid integer
);


ALTER TABLE ccp.translationtables OWNER TO emtools;

--
-- Name: trntranslationcolumns; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE trntranslationcolumns (
    tcgroupid smallint,
    tcid smallint NOT NULL,
    tablename character varying(512) NOT NULL,
    columnname character varying(256) NOT NULL,
    masterid character varying(256) DEFAULT NULL::character varying
);


ALTER TABLE ccp.trntranslationcolumns OWNER TO emtools;

--
-- Name: trntranslationlanguages; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE trntranslationlanguages (
    numericlanguageid integer NOT NULL,
    languageid character varying(50) DEFAULT NULL::character varying,
    languagename character varying(400) DEFAULT NULL::character varying
);


ALTER TABLE ccp.trntranslationlanguages OWNER TO emtools;

--
-- Name: trntranslations; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE trntranslations (
    tcid smallint NOT NULL,
    keyid integer NOT NULL,
    languageid character varying(50) NOT NULL,
    text text NOT NULL
);


ALTER TABLE ccp.trntranslations OWNER TO emtools;

--
-- Name: warcombatzones; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE warcombatzones (
    combatzoneid integer DEFAULT (-1) NOT NULL,
    combatzonename character varying(200) DEFAULT NULL::character varying,
    factionid integer,
    centersystemid integer,
    description character varying(1000) DEFAULT NULL::character varying
);


ALTER TABLE ccp.warcombatzones OWNER TO emtools;

--
-- Name: warcombatzonesystems; Type: TABLE; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE TABLE warcombatzonesystems (
    solarsystemid integer NOT NULL,
    combatzoneid integer
);


ALTER TABLE ccp.warcombatzonesystems OWNER TO emtools;

SET search_path = public, pg_catalog;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO emtools;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO emtools;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO emtools;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO emtools;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_message; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO emtools;

--
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO emtools;

--
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO emtools;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO emtools;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO emtools;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO emtools;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO emtools;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO emtools;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO emtools;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO emtools;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: ccpeve_apikey; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE ccpeve_apikey (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    userid character varying(32),
    apikey character varying(128),
    characterid character varying(32) NOT NULL,
    active boolean NOT NULL,
    message text NOT NULL,
    last_attempt timestamp with time zone NOT NULL,
    keyid character varying(32),
    vcode character varying(128)
);


ALTER TABLE public.ccpeve_apikey OWNER TO emtools;

--
-- Name: ccpeve_apikey_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE ccpeve_apikey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ccpeve_apikey_id_seq OWNER TO emtools;

--
-- Name: ccpeve_apikey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE ccpeve_apikey_id_seq OWNED BY ccpeve_apikey.id;


--
-- Name: ccpeve_cache; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE ccpeve_cache (
    id integer NOT NULL,
    cacheduntil timestamp with time zone NOT NULL,
    host character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    params text NOT NULL,
    doc text NOT NULL
);


ALTER TABLE public.ccpeve_cache OWNER TO emtools;

--
-- Name: ccpeve_cache_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE ccpeve_cache_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ccpeve_cache_id_seq OWNER TO emtools;

--
-- Name: ccpeve_cache_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE ccpeve_cache_id_seq OWNED BY ccpeve_cache.id;


--
-- Name: ccpeve_division; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE ccpeve_division (
    id integer NOT NULL,
    apitimestamp timestamp with time zone NOT NULL,
    ownerid bigint NOT NULL,
    "accountKey" integer NOT NULL,
    hangarname character varying(255) NOT NULL,
    walletname character varying(255) NOT NULL
);


ALTER TABLE public.ccpeve_division OWNER TO emtools;

--
-- Name: ccpeve_division_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE ccpeve_division_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ccpeve_division_id_seq OWNER TO emtools;

--
-- Name: ccpeve_division_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE ccpeve_division_id_seq OWNED BY ccpeve_division.id;


--
-- Name: channels_changelog; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE channels_changelog (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    channel character varying(255) NOT NULL,
    action character varying(255) NOT NULL
);


ALTER TABLE public.channels_changelog OWNER TO emtools;

--
-- Name: channels_changelog_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE channels_changelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.channels_changelog_id_seq OWNER TO emtools;

--
-- Name: channels_changelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE channels_changelog_id_seq OWNED BY channels_changelog.id;


--
-- Name: channels_channel; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE channels_channel (
    id integer NOT NULL,
    category character varying(128) NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.channels_channel OWNER TO emtools;

--
-- Name: channels_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE channels_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.channels_channel_id_seq OWNER TO emtools;

--
-- Name: channels_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE channels_channel_id_seq OWNED BY channels_channel.id;


--
-- Name: corpreport_divisionconfig; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE corpreport_divisionconfig (
    id integer NOT NULL,
    division_id integer NOT NULL,
    usewallet boolean NOT NULL,
    usehangar boolean NOT NULL
);


ALTER TABLE public.corpreport_divisionconfig OWNER TO emtools;

--
-- Name: corpreport_divisionconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE corpreport_divisionconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.corpreport_divisionconfig_id_seq OWNER TO emtools;

--
-- Name: corpreport_divisionconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE corpreport_divisionconfig_id_seq OWNED BY corpreport_divisionconfig.id;


--
-- Name: corpreport_reportcategory; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE corpreport_reportcategory (
    id integer NOT NULL,
    type_id integer NOT NULL,
    category character varying(255)
);


ALTER TABLE public.corpreport_reportcategory OWNER TO emtools;

--
-- Name: corpreport_reportcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE corpreport_reportcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.corpreport_reportcategory_id_seq OWNER TO emtools;

--
-- Name: corpreport_reportcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE corpreport_reportcategory_id_seq OWNED BY corpreport_reportcategory.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO emtools;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO emtools;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO emtools;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO emtools;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO emtools;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO emtools;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO emtools;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: emadmin_lastupdate; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE emadmin_lastupdate (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.emadmin_lastupdate OWNER TO emtools;

--
-- Name: emadmin_lastupdate_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE emadmin_lastupdate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.emadmin_lastupdate_id_seq OWNER TO emtools;

--
-- Name: emadmin_lastupdate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE emadmin_lastupdate_id_seq OWNED BY emadmin_lastupdate.id;


--
-- Name: emadmin_logrecord; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE emadmin_logrecord (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.emadmin_logrecord OWNER TO emtools;

--
-- Name: emadmin_logrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE emadmin_logrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.emadmin_logrecord_id_seq OWNER TO emtools;

--
-- Name: emadmin_logrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE emadmin_logrecord_id_seq OWNED BY emadmin_logrecord.id;


--
-- Name: emadmin_schedule; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE emadmin_schedule (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    last_run timestamp with time zone NOT NULL,
    next_run timestamp with time zone
);


ALTER TABLE public.emadmin_schedule OWNER TO emtools;

--
-- Name: emadmin_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE emadmin_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.emadmin_schedule_id_seq OWNER TO emtools;

--
-- Name: emadmin_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE emadmin_schedule_id_seq OWNED BY emadmin_schedule.id;


--
-- Name: emauth_authlog; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE emauth_authlog (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    corp character varying(255),
    message text NOT NULL
);


ALTER TABLE public.emauth_authlog OWNER TO emtools;

--
-- Name: emauth_authlog_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE emauth_authlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.emauth_authlog_id_seq OWNER TO emtools;

--
-- Name: emauth_authlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE emauth_authlog_id_seq OWNED BY emauth_authlog.id;


--
-- Name: emauth_authtoken; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE emauth_authtoken (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE public.emauth_authtoken OWNER TO emtools;

--
-- Name: emauth_authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE emauth_authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.emauth_authtoken_id_seq OWNER TO emtools;

--
-- Name: emauth_authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE emauth_authtoken_id_seq OWNED BY emauth_authtoken.id;


--
-- Name: emauth_profile; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE emauth_profile (
    user_id integer NOT NULL,
    mybb_uid integer,
    mybb_username character varying(120),
    usertitle character varying(120),
    name character varying(255),
    characterid integer,
    corp character varying(255),
    corpid integer,
    alliance character varying(255),
    allianceid integer,
    last_check timestamp with time zone,
    active boolean NOT NULL
);


ALTER TABLE public.emauth_profile OWNER TO emtools;

--
-- Name: gmi_index; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gmi_index (
    latest_id integer NOT NULL
);


ALTER TABLE public.gmi_index OWNER TO emtools;

--
-- Name: gmi_indexhistory; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gmi_indexhistory (
    id integer NOT NULL,
    "timestamp" date NOT NULL,
    typeid bigint NOT NULL,
    republic double precision NOT NULL,
    republicvolume bigint NOT NULL,
    republicchange double precision,
    heimatar double precision NOT NULL,
    heimatarvolume bigint NOT NULL,
    heimatarchange double precision,
    heimatarage integer,
    metropolis double precision NOT NULL,
    metropolisvolume bigint NOT NULL,
    metropolischange double precision,
    metropolisage integer,
    moldenheath double precision NOT NULL,
    moldenheathvolume bigint NOT NULL,
    moldenheathchange double precision,
    moldenheathage integer,
    jita double precision NOT NULL,
    jitavolume bigint NOT NULL,
    jitachange double precision,
    jitaage integer
);


ALTER TABLE public.gmi_indexhistory OWNER TO emtools;

--
-- Name: gmi_indexhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE gmi_indexhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gmi_indexhistory_id_seq OWNER TO emtools;

--
-- Name: gmi_indexhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE gmi_indexhistory_id_seq OWNED BY gmi_indexhistory.id;


--
-- Name: gmi_upload; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gmi_upload (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer,
    regionid bigint NOT NULL,
    typeid bigint NOT NULL,
    calltimestamp timestamp with time zone NOT NULL
);


ALTER TABLE public.gmi_upload OWNER TO emtools;

--
-- Name: gmi_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE gmi_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gmi_upload_id_seq OWNER TO emtools;

--
-- Name: gmi_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE gmi_upload_id_seq OWNED BY gmi_upload.id;


--
-- Name: gts_comment; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gts_comment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    ticket_id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.gts_comment OWNER TO emtools;

--
-- Name: gts_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE gts_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gts_comment_id_seq OWNER TO emtools;

--
-- Name: gts_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE gts_comment_id_seq OWNED BY gts_comment.id;


--
-- Name: gts_state; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gts_state (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    displayname character varying(32) NOT NULL
);


ALTER TABLE public.gts_state OWNER TO emtools;

--
-- Name: gts_state_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE gts_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gts_state_id_seq OWNER TO emtools;

--
-- Name: gts_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE gts_state_id_seq OWNED BY gts_state.id;


--
-- Name: gts_ticket; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gts_ticket (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    createdby_id integer NOT NULL,
    edited timestamp with time zone,
    editedby_id integer,
    assigned timestamp with time zone,
    assignedto_id integer,
    closed timestamp with time zone,
    delayeduntil timestamp with time zone,
    state_id integer NOT NULL,
    type_id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.gts_ticket OWNER TO emtools;

--
-- Name: gts_ticket_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE gts_ticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gts_ticket_id_seq OWNER TO emtools;

--
-- Name: gts_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE gts_ticket_id_seq OWNED BY gts_ticket.id;


--
-- Name: gts_tickettype; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gts_tickettype (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.gts_tickettype OWNER TO emtools;

--
-- Name: gts_tickettype_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE gts_tickettype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gts_tickettype_id_seq OWNER TO emtools;

--
-- Name: gts_tickettype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE gts_tickettype_id_seq OWNED BY gts_tickettype.id;


--
-- Name: gts_tickettype_users; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE gts_tickettype_users (
    id integer NOT NULL,
    tickettype_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.gts_tickettype_users OWNER TO emtools;

--
-- Name: gts_tickettype_users_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE gts_tickettype_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gts_tickettype_users_id_seq OWNER TO emtools;

--
-- Name: gts_tickettype_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE gts_tickettype_users_id_seq OWNED BY gts_tickettype_users.id;


--
-- Name: index_index; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE index_index (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT '2000-01-01 00:00:00+01'::timestamp with time zone NOT NULL,
    typeid bigint NOT NULL,
    typename character varying(128) NOT NULL,
    category character varying(128) NOT NULL,
    refineable boolean DEFAULT false NOT NULL,
    ordering integer NOT NULL,
    republic double precision DEFAULT 0.0 NOT NULL,
    republicvolume bigint DEFAULT 0 NOT NULL,
    republicchange double precision DEFAULT 0.0 NOT NULL,
    heimatar double precision DEFAULT 0.0 NOT NULL,
    heimatarvolume bigint DEFAULT 0 NOT NULL,
    heimatarchange double precision DEFAULT 0.0 NOT NULL,
    heimatarage integer DEFAULT 0 NOT NULL,
    metropolis double precision DEFAULT 0.0 NOT NULL,
    metropolisvolume bigint DEFAULT 0 NOT NULL,
    metropolischange double precision DEFAULT 0.0 NOT NULL,
    metropolisage integer DEFAULT 0 NOT NULL,
    moldenheath double precision DEFAULT 0.0 NOT NULL,
    moldenheathvolume bigint DEFAULT 0 NOT NULL,
    moldenheathchange double precision DEFAULT 0.0 NOT NULL,
    moldenheathage integer DEFAULT 0 NOT NULL,
    jita double precision DEFAULT 0.0 NOT NULL,
    jitavolume bigint DEFAULT 0 NOT NULL,
    jitachange double precision DEFAULT 0.0 NOT NULL,
    jitaage integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.index_index OWNER TO emtools;

--
-- Name: index_index_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE index_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.index_index_id_seq OWNER TO emtools;

--
-- Name: index_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE index_index_id_seq OWNED BY index_index.id;


--
-- Name: index_indexhistory; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE index_indexhistory (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    typeid bigint NOT NULL,
    republic double precision NOT NULL,
    republicvolume bigint NOT NULL,
    republicchange double precision NOT NULL,
    heimatar double precision NOT NULL,
    heimatarvolume bigint NOT NULL,
    heimatarchange double precision NOT NULL,
    heimatarage integer NOT NULL,
    metropolis double precision NOT NULL,
    metropolisvolume bigint NOT NULL,
    metropolischange double precision NOT NULL,
    metropolisage integer NOT NULL,
    moldenheath double precision NOT NULL,
    moldenheathvolume bigint NOT NULL,
    moldenheathchange double precision NOT NULL,
    moldenheathage integer NOT NULL,
    jita double precision NOT NULL,
    jitavolume bigint NOT NULL,
    jitachange double precision NOT NULL,
    jitaage integer NOT NULL
);


ALTER TABLE public.index_indexhistory OWNER TO emtools;

--
-- Name: index_indexhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE index_indexhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.index_indexhistory_id_seq OWNER TO emtools;

--
-- Name: index_indexhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE index_indexhistory_id_seq OWNED BY index_indexhistory.id;


--
-- Name: industry_account; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_account (
    id integer NOT NULL,
    accountkey integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.industry_account OWNER TO emtools;

--
-- Name: industry_account_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_account_id_seq OWNER TO emtools;

--
-- Name: industry_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_account_id_seq OWNED BY industry_account.id;


--
-- Name: industry_blueprintoriginal; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_blueprintoriginal (
    id integer NOT NULL,
    typeid integer NOT NULL,
    me integer NOT NULL,
    pe integer DEFAULT 0 NOT NULL,
    typename character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.industry_blueprintoriginal OWNER TO emtools;

--
-- Name: industry_blueprintoriginal_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_blueprintoriginal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_blueprintoriginal_id_seq OWNER TO emtools;

--
-- Name: industry_blueprintoriginal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_blueprintoriginal_id_seq OWNED BY industry_blueprintoriginal.id;


--
-- Name: industry_journal; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_journal (
    id integer NOT NULL,
    journalid bigint NOT NULL,
    accountkey integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    amount double precision NOT NULL,
    ownerid1 bigint NOT NULL,
    ownerid2 bigint NOT NULL,
    argname1 character varying(255) NOT NULL,
    argid1 bigint NOT NULL,
    reason character varying(255) NOT NULL,
    reftypeid integer DEFAULT (-1) NOT NULL
);


ALTER TABLE public.industry_journal OWNER TO emtools;

--
-- Name: industry_journal_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_journal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_journal_id_seq OWNER TO emtools;

--
-- Name: industry_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_journal_id_seq OWNED BY industry_journal.id;


--
-- Name: industry_lastupdate; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_lastupdate (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.industry_lastupdate OWNER TO emtools;

--
-- Name: industry_lastupdate_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_lastupdate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_lastupdate_id_seq OWNER TO emtools;

--
-- Name: industry_lastupdate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_lastupdate_id_seq OWNED BY industry_lastupdate.id;


--
-- Name: industry_marketorder; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_marketorder (
    id integer NOT NULL,
    characterid bigint NOT NULL,
    stationid bigint NOT NULL,
    ordertype character varying(5) NOT NULL,
    expires timestamp with time zone NOT NULL,
    volremaining integer NOT NULL,
    price double precision NOT NULL,
    productioncost double precision NOT NULL,
    salesperday double precision NOT NULL,
    trend double precision NOT NULL,
    typeid bigint NOT NULL,
    competitionprice double precision
);


ALTER TABLE public.industry_marketorder OWNER TO emtools;

--
-- Name: industry_marketorder_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_marketorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_marketorder_id_seq OWNER TO emtools;

--
-- Name: industry_marketorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_marketorder_id_seq OWNED BY industry_marketorder.id;


--
-- Name: industry_marketprice; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_marketprice (
    id integer NOT NULL,
    last_seen timestamp with time zone NOT NULL,
    typeid bigint NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.industry_marketprice OWNER TO emtools;

--
-- Name: industry_marketprice_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_marketprice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_marketprice_id_seq OWNER TO emtools;

--
-- Name: industry_marketprice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_marketprice_id_seq OWNED BY industry_marketprice.id;


--
-- Name: industry_pricelist; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_pricelist (
    id integer NOT NULL,
    typename character varying(255) NOT NULL,
    typeid bigint NOT NULL,
    productioncost double precision NOT NULL,
    safetymargin double precision NOT NULL
);


ALTER TABLE public.industry_pricelist OWNER TO emtools;

--
-- Name: industry_pricelist_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_pricelist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_pricelist_id_seq OWNER TO emtools;

--
-- Name: industry_pricelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_pricelist_id_seq OWNED BY industry_pricelist.id;


--
-- Name: industry_publicmarketorder; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_publicmarketorder (
    id integer NOT NULL,
    last_seen timestamp with time zone NOT NULL,
    ordertype character varying(5) NOT NULL,
    regionid bigint NOT NULL,
    systemid bigint NOT NULL,
    stationid bigint NOT NULL,
    range integer NOT NULL,
    typeid bigint NOT NULL,
    volremain integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.industry_publicmarketorder OWNER TO emtools;

--
-- Name: industry_publicmarketorder_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_publicmarketorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_publicmarketorder_id_seq OWNER TO emtools;

--
-- Name: industry_publicmarketorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_publicmarketorder_id_seq OWNED BY industry_publicmarketorder.id;


--
-- Name: industry_stock; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_stock (
    id integer NOT NULL,
    typename character varying(255) NOT NULL,
    typeid bigint NOT NULL,
    stationid bigint NOT NULL,
    current integer NOT NULL,
    level_id integer,
    price_id integer
);


ALTER TABLE public.industry_stock OWNER TO emtools;

--
-- Name: industry_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_stock_id_seq OWNER TO emtools;

--
-- Name: industry_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_stock_id_seq OWNED BY industry_stock.id;


--
-- Name: industry_stocklevel; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_stocklevel (
    id integer NOT NULL,
    typename character varying(255) NOT NULL,
    typeid bigint NOT NULL,
    stationid bigint NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL,
    stationname character varying(255),
    comment text NOT NULL
);


ALTER TABLE public.industry_stocklevel OWNER TO emtools;

--
-- Name: industry_stocklevel_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_stocklevel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_stocklevel_id_seq OWNER TO emtools;

--
-- Name: industry_stocklevel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_stocklevel_id_seq OWNED BY industry_stocklevel.id;


--
-- Name: industry_stocklevel_watcher; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_stocklevel_watcher (
    id integer NOT NULL,
    stocklevel_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.industry_stocklevel_watcher OWNER TO emtools;

--
-- Name: industry_stocklevel_watcher_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_stocklevel_watcher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_stocklevel_watcher_id_seq OWNER TO emtools;

--
-- Name: industry_stocklevel_watcher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_stocklevel_watcher_id_seq OWNED BY industry_stocklevel_watcher.id;


--
-- Name: industry_transaction; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_transaction (
    id integer NOT NULL,
    transactionid bigint NOT NULL,
    accountkey integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    typeid bigint NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    clientid bigint NOT NULL,
    stationid bigint NOT NULL,
    transactiontype character varying(5) NOT NULL,
    journalid bigint NOT NULL,
    characterid bigint
);


ALTER TABLE public.industry_transaction OWNER TO emtools;

--
-- Name: industry_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_transaction_id_seq OWNER TO emtools;

--
-- Name: industry_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_transaction_id_seq OWNED BY industry_transaction.id;


--
-- Name: industry_transactioninfo; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_transactioninfo (
    id integer NOT NULL,
    transaction_id integer NOT NULL,
    account_id integer NOT NULL,
    typename character varying(128) NOT NULL,
    stationname character varying(128) NOT NULL,
    clientname character varying(128),
    clientstanding integer,
    clientcorp character varying(128) NOT NULL,
    clientcorpid bigint NOT NULL,
    clientcorpstanding integer,
    clientalliance character varying(128) NOT NULL,
    clientallianceid bigint,
    clientalliancestanding integer,
    charactername character varying(128) NOT NULL,
    cost double precision,
    safetymargin double precision DEFAULT 1.0
);


ALTER TABLE public.industry_transactioninfo OWNER TO emtools;

--
-- Name: industry_transactioninfo_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_transactioninfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_transactioninfo_id_seq OWNER TO emtools;

--
-- Name: industry_transactioninfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_transactioninfo_id_seq OWNED BY industry_transactioninfo.id;


--
-- Name: industry_wantedmarketorder; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE industry_wantedmarketorder (
    id integer NOT NULL,
    characterid bigint,
    stationid bigint NOT NULL,
    typeid bigint NOT NULL,
    forcorp boolean NOT NULL,
    ordertype character varying(5) NOT NULL,
    quantity integer NOT NULL,
    charactername character varying(255),
    stationname character varying(255),
    typename character varying(255),
    comment text DEFAULT ''::text
);


ALTER TABLE public.industry_wantedmarketorder OWNER TO emtools;

--
-- Name: industry_wantedmarketorder_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE industry_wantedmarketorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.industry_wantedmarketorder_id_seq OWNER TO emtools;

--
-- Name: industry_wantedmarketorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE industry_wantedmarketorder_id_seq OWNED BY industry_wantedmarketorder.id;


--
-- Name: intel_alliance; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_alliance (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    allianceid bigint,
    lastseen timestamp with time zone NOT NULL,
    ticker character varying(12),
    members integer,
    standing integer,
    lastkillinfo timestamp without time zone,
    lastapi timestamp without time zone,
    lastcache timestamp without time zone,
    do_api_check boolean DEFAULT false NOT NULL
);


ALTER TABLE public.intel_alliance OWNER TO emtools;

--
-- Name: intel_alliance_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_alliance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_alliance_id_seq OWNER TO emtools;

--
-- Name: intel_alliance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_alliance_id_seq OWNED BY intel_alliance.id;


--
-- Name: intel_change; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_change (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    changetype character varying(128) NOT NULL,
    pilot_id integer,
    corporation_id integer,
    alliance_id integer,
    oldint integer,
    oldstring character varying(128) NOT NULL,
    oldcorp_id integer,
    oldalliance_id integer,
    oldfaction_id integer,
    newint integer,
    newstring character varying(128) NOT NULL,
    newcorp_id integer,
    newalliance_id integer,
    newfaction_id integer
);


ALTER TABLE public.intel_change OWNER TO emtools;

--
-- Name: intel_change_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_change_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_change_id_seq OWNER TO emtools;

--
-- Name: intel_change_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_change_id_seq OWNED BY intel_change.id;


--
-- Name: intel_changelog; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_changelog (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    pilot_id integer NOT NULL,
    oldcorp_id integer,
    newcorp_id integer,
    oldalliance_id integer,
    newalliance_id integer
);


ALTER TABLE public.intel_changelog OWNER TO emtools;

--
-- Name: intel_changelog_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_changelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_changelog_id_seq OWNER TO emtools;

--
-- Name: intel_changelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_changelog_id_seq OWNED BY intel_changelog.id;


--
-- Name: intel_corporation; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_corporation (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    corporationid bigint,
    alliance_id integer,
    lastseen timestamp with time zone NOT NULL,
    ticker character varying(12),
    members integer,
    standing integer,
    lastkillinfo timestamp without time zone,
    lastapi timestamp without time zone,
    lastcache timestamp without time zone,
    faction_id integer,
    do_api_check boolean DEFAULT false NOT NULL,
    do_cache_check boolean DEFAULT false NOT NULL
);


ALTER TABLE public.intel_corporation OWNER TO emtools;

--
-- Name: intel_corporation_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_corporation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_corporation_id_seq OWNER TO emtools;

--
-- Name: intel_corporation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_corporation_id_seq OWNED BY intel_corporation.id;


--
-- Name: intel_edkfeed; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_edkfeed (
    id integer NOT NULL,
    lastchecked timestamp with time zone,
    corpid bigint,
    allianceid bigint,
    state text,
    failed_attempts integer NOT NULL,
    error character varying(255) NOT NULL
);


ALTER TABLE public.intel_edkfeed OWNER TO emtools;

--
-- Name: intel_edkfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_edkfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_edkfeed_id_seq OWNER TO emtools;

--
-- Name: intel_edkfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_edkfeed_id_seq OWNED BY intel_edkfeed.id;


--
-- Name: intel_entity; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_entity (
    id integer NOT NULL,
    itemid bigint,
    entitytype character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    parent_id integer,
    faction_id integer,
    ticker character varying(17),
    size integer NOT NULL,
    pilot_security double precision,
    is_npc boolean NOT NULL,
    last_api_check timestamp with time zone,
    last_seen timestamp with time zone
);


ALTER TABLE public.intel_entity OWNER TO emtools;

--
-- Name: intel_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_entity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_entity_id_seq OWNER TO emtools;

--
-- Name: intel_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_entity_id_seq OWNED BY intel_entity.id;


--
-- Name: intel_faction; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_faction (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    factionid bigint
);


ALTER TABLE public.intel_faction OWNER TO emtools;

--
-- Name: intel_faction_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_faction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_faction_id_seq OWNER TO emtools;

--
-- Name: intel_faction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_faction_id_seq OWNED BY intel_faction.id;


--
-- Name: intel_feed; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_feed (
    id integer NOT NULL,
    feedtype character varying(32) NOT NULL,
    url character varying(255) NOT NULL,
    state text,
    failed_attempts integer DEFAULT 0 NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    error text DEFAULT ''::text NOT NULL,
    lastchecked timestamp without time zone
);


ALTER TABLE public.intel_feed OWNER TO emtools;

--
-- Name: intel_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_feed_id_seq OWNER TO emtools;

--
-- Name: intel_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_feed_id_seq OWNED BY intel_feed.id;


--
-- Name: intel_kill; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_kill (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    system_id integer NOT NULL,
    hash character varying(128) NOT NULL,
    pickle text NOT NULL,
    original text,
    involved_added boolean DEFAULT false NOT NULL
);


ALTER TABLE public.intel_kill OWNER TO emtools;

--
-- Name: intel_kill_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_kill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_kill_id_seq OWNER TO emtools;

--
-- Name: intel_kill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_kill_id_seq OWNED BY intel_kill.id;


--
-- Name: intel_kill_involvedalliances; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_kill_involvedalliances (
    id integer NOT NULL,
    kill_id integer NOT NULL,
    alliance_id integer NOT NULL
);


ALTER TABLE public.intel_kill_involvedalliances OWNER TO emtools;

--
-- Name: intel_kill_involvedalliances_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_kill_involvedalliances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_kill_involvedalliances_id_seq OWNER TO emtools;

--
-- Name: intel_kill_involvedalliances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_kill_involvedalliances_id_seq OWNED BY intel_kill_involvedalliances.id;


--
-- Name: intel_kill_involvedcorps; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_kill_involvedcorps (
    id integer NOT NULL,
    kill_id integer NOT NULL,
    corporation_id integer NOT NULL
);


ALTER TABLE public.intel_kill_involvedcorps OWNER TO emtools;

--
-- Name: intel_kill_involvedcorps_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_kill_involvedcorps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_kill_involvedcorps_id_seq OWNER TO emtools;

--
-- Name: intel_kill_involvedcorps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_kill_involvedcorps_id_seq OWNED BY intel_kill_involvedcorps.id;


--
-- Name: intel_kill_involvedfactions; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_kill_involvedfactions (
    id integer NOT NULL,
    kill_id integer NOT NULL,
    faction_id integer NOT NULL
);


ALTER TABLE public.intel_kill_involvedfactions OWNER TO emtools;

--
-- Name: intel_kill_involvedfactions_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_kill_involvedfactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_kill_involvedfactions_id_seq OWNER TO emtools;

--
-- Name: intel_kill_involvedfactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_kill_involvedfactions_id_seq OWNED BY intel_kill_involvedfactions.id;


--
-- Name: intel_kill_involvedpilots; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_kill_involvedpilots (
    id integer NOT NULL,
    kill_id integer NOT NULL,
    pilot_id integer NOT NULL
);


ALTER TABLE public.intel_kill_involvedpilots OWNER TO emtools;

--
-- Name: intel_kill_involvedpilots_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_kill_involvedpilots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_kill_involvedpilots_id_seq OWNER TO emtools;

--
-- Name: intel_kill_involvedpilots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_kill_involvedpilots_id_seq OWNED BY intel_kill_involvedpilots.id;


--
-- Name: intel_pilot; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_pilot (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    characterid bigint,
    corporation_id integer,
    alliance_id integer,
    lastseen timestamp with time zone NOT NULL,
    security double precision,
    lastkillinfo timestamp without time zone,
    lastapi timestamp without time zone,
    lastcache timestamp without time zone,
    evewho boolean DEFAULT false NOT NULL,
    do_api_check boolean DEFAULT false NOT NULL
);


ALTER TABLE public.intel_pilot OWNER TO emtools;

--
-- Name: intel_pilot_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_pilot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_pilot_id_seq OWNER TO emtools;

--
-- Name: intel_pilot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_pilot_id_seq OWNED BY intel_pilot.id;


--
-- Name: intel_trace; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_trace (
    id integer NOT NULL,
    submitted timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    pilot_id integer NOT NULL,
    corporation_id integer NOT NULL,
    alliance_id integer,
    system character varying(128) NOT NULL,
    systemid integer NOT NULL,
    station character varying(128),
    stationid integer,
    agent character varying(128),
    online boolean,
    submitter_id integer
);


ALTER TABLE public.intel_trace OWNER TO emtools;

--
-- Name: intel_trace_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_trace_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_trace_id_seq OWNER TO emtools;

--
-- Name: intel_trace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_trace_id_seq OWNED BY intel_trace.id;


--
-- Name: intel_trackedentity; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE intel_trackedentity (
    id integer NOT NULL,
    corporation_id integer,
    alliance_id integer
);


ALTER TABLE public.intel_trackedentity OWNER TO emtools;

--
-- Name: intel_trackedentity_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE intel_trackedentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.intel_trackedentity_id_seq OWNER TO emtools;

--
-- Name: intel_trackedentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE intel_trackedentity_id_seq OWNED BY intel_trackedentity.id;


--
-- Name: rc_change; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE rc_change (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    app character varying(32) NOT NULL,
    category character varying(32) NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.rc_change OWNER TO emtools;

--
-- Name: rc_change_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE rc_change_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rc_change_id_seq OWNER TO emtools;

--
-- Name: rc_change_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE rc_change_id_seq OWNED BY rc_change.id;


--
-- Name: recruitment_character; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE recruitment_character (
    id integer NOT NULL,
    user_id integer NOT NULL,
    characterid bigint NOT NULL,
    name character varying(255) NOT NULL,
    gender character varying(32) NOT NULL,
    race character varying(255) NOT NULL,
    bloodline character varying(255) NOT NULL,
    security double precision NOT NULL,
    graduation timestamp with time zone NOT NULL,
    skillpoints integer NOT NULL,
    wallet double precision NOT NULL,
    corpid bigint NOT NULL,
    corpname character varying(255) NOT NULL,
    corpjoin timestamp with time zone NOT NULL,
    allianceid bigint,
    alliancename character varying(255),
    alliancejoin timestamp with time zone
);


ALTER TABLE public.recruitment_character OWNER TO emtools;

--
-- Name: recruitment_character_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE recruitment_character_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.recruitment_character_id_seq OWNER TO emtools;

--
-- Name: recruitment_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE recruitment_character_id_seq OWNED BY recruitment_character.id;


--
-- Name: recruitment_implant; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE recruitment_implant (
    id integer NOT NULL,
    character_id integer NOT NULL,
    attribute character varying(255) NOT NULL,
    augmentor character varying(255) NOT NULL,
    value integer NOT NULL
);


ALTER TABLE public.recruitment_implant OWNER TO emtools;

--
-- Name: recruitment_implant_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE recruitment_implant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.recruitment_implant_id_seq OWNER TO emtools;

--
-- Name: recruitment_implant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE recruitment_implant_id_seq OWNED BY recruitment_implant.id;


--
-- Name: recruitment_skill; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE recruitment_skill (
    id integer NOT NULL,
    character_id integer NOT NULL,
    typeid bigint NOT NULL,
    typename character varying(255) NOT NULL,
    skillpoints integer NOT NULL,
    level integer NOT NULL,
    published boolean NOT NULL
);


ALTER TABLE public.recruitment_skill OWNER TO emtools;

--
-- Name: recruitment_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE recruitment_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.recruitment_skill_id_seq OWNER TO emtools;

--
-- Name: recruitment_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE recruitment_skill_id_seq OWNED BY recruitment_skill.id;


--
-- Name: recruitment_standing; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE recruitment_standing (
    id integer NOT NULL,
    character_id integer NOT NULL,
    entitytype character varying(32) NOT NULL,
    fromid bigint NOT NULL,
    fromname character varying(255) NOT NULL,
    standing double precision NOT NULL
);


ALTER TABLE public.recruitment_standing OWNER TO emtools;

--
-- Name: recruitment_standing_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE recruitment_standing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.recruitment_standing_id_seq OWNER TO emtools;

--
-- Name: recruitment_standing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE recruitment_standing_id_seq OWNED BY recruitment_standing.id;


--
-- Name: recruitment_user; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE recruitment_user (
    id integer NOT NULL,
    userid bigint NOT NULL,
    submitted timestamp with time zone NOT NULL,
    visibility character varying(255)
);


ALTER TABLE public.recruitment_user OWNER TO emtools;

--
-- Name: recruitment_user_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE recruitment_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.recruitment_user_id_seq OWNER TO emtools;

--
-- Name: recruitment_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE recruitment_user_id_seq OWNED BY recruitment_user.id;


--
-- Name: shop_message; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE shop_message (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    characterid bigint NOT NULL,
    name character varying(255) NOT NULL,
    read_by_customer boolean NOT NULL,
    read_by_handler boolean NOT NULL,
    handler_id integer,
    text text NOT NULL
);


ALTER TABLE public.shop_message OWNER TO emtools;

--
-- Name: shop_message_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE shop_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shop_message_id_seq OWNER TO emtools;

--
-- Name: shop_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE shop_message_id_seq OWNED BY shop_message.id;


--
-- Name: shop_order; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE shop_order (
    id integer NOT NULL,
    characterid bigint NOT NULL,
    name character varying(255) NOT NULL,
    corpid bigint NOT NULL,
    corpname character varying(255) NOT NULL,
    allianceid bigint,
    alliancename character varying(255) NOT NULL,
    standing double precision NOT NULL,
    discount character varying(32) NOT NULL,
    multiplier double precision NOT NULL,
    lastchecked timestamp with time zone NOT NULL,
    typeid bigint NOT NULL,
    typename character varying(255) NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    office_id integer NOT NULL,
    handler_id integer,
    closed timestamp with time zone,
    cancelled boolean NOT NULL,
    created timestamp with time zone
);


ALTER TABLE public.shop_order OWNER TO emtools;

--
-- Name: shop_order_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE shop_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shop_order_id_seq OWNER TO emtools;

--
-- Name: shop_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE shop_order_id_seq OWNED BY shop_order.id;


--
-- Name: shop_orderhandler; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE shop_orderhandler (
    user_id integer NOT NULL
);


ALTER TABLE public.shop_orderhandler OWNER TO emtools;

--
-- Name: shop_salesoffice; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE shop_salesoffice (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    stationid bigint NOT NULL,
    stationname character varying(255) NOT NULL,
    description text NOT NULL,
    multiplier double precision DEFAULT 1.0 NOT NULL
);


ALTER TABLE public.shop_salesoffice OWNER TO emtools;

--
-- Name: shop_salesoffice_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE shop_salesoffice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shop_salesoffice_id_seq OWNER TO emtools;

--
-- Name: shop_salesoffice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE shop_salesoffice_id_seq OWNED BY shop_salesoffice.id;


--
-- Name: timezones_tzconfig; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE timezones_tzconfig (
    id integer NOT NULL,
    user_id integer NOT NULL,
    timezone character varying(128) NOT NULL,
    public boolean NOT NULL
);


ALTER TABLE public.timezones_tzconfig OWNER TO emtools;

--
-- Name: timezones_tzconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE timezones_tzconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.timezones_tzconfig_id_seq OWNER TO emtools;

--
-- Name: timezones_tzconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE timezones_tzconfig_id_seq OWNED BY timezones_tzconfig.id;


--
-- Name: uploader_authtoken; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_authtoken (
    id integer NOT NULL,
    user_id integer NOT NULL,
    tokenstring character varying(64) NOT NULL,
    numuploads integer NOT NULL,
    numbytes bigint NOT NULL
);


ALTER TABLE public.uploader_authtoken OWNER TO emtools;

--
-- Name: uploader_authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_authtoken_id_seq OWNER TO emtools;

--
-- Name: uploader_authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_authtoken_id_seq OWNED BY uploader_authtoken.id;


--
-- Name: uploader_corpfaction; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_corpfaction (
    id integer NOT NULL,
    uploadtimestamp timestamp with time zone NOT NULL,
    submitter_id integer NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    corpid bigint NOT NULL,
    factionid bigint NOT NULL
);


ALTER TABLE public.uploader_corpfaction OWNER TO emtools;

--
-- Name: uploader_corpfaction_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_corpfaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_corpfaction_id_seq OWNER TO emtools;

--
-- Name: uploader_corpfaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_corpfaction_id_seq OWNED BY uploader_corpfaction.id;


--
-- Name: uploader_corpfactionhistory; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_corpfactionhistory (
    id integer NOT NULL,
    corporationid bigint NOT NULL,
    factionid bigint NOT NULL,
    starttimestamp timestamp with time zone NOT NULL,
    endtimestamp timestamp with time zone
);


ALTER TABLE public.uploader_corpfactionhistory OWNER TO emtools;

--
-- Name: uploader_corpfactionhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_corpfactionhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_corpfactionhistory_id_seq OWNER TO emtools;

--
-- Name: uploader_corpfactionhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_corpfactionhistory_id_seq OWNED BY uploader_corpfactionhistory.id;


--
-- Name: uploader_corpfactionhistory_uploads; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_corpfactionhistory_uploads (
    id integer NOT NULL,
    corpfactionhistory_id integer NOT NULL,
    upload_id integer NOT NULL
);


ALTER TABLE public.uploader_corpfactionhistory_uploads OWNER TO emtools;

--
-- Name: uploader_corpfactionhistory_uploads_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_corpfactionhistory_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_corpfactionhistory_uploads_id_seq OWNER TO emtools;

--
-- Name: uploader_corpfactionhistory_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_corpfactionhistory_uploads_id_seq OWNED BY uploader_corpfactionhistory_uploads.id;


--
-- Name: uploader_facwarsystem; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_facwarsystem (
    id integer NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    solarsystemid bigint NOT NULL,
    solarsystemname character varying(128) NOT NULL,
    occupyingfactionid bigint NOT NULL,
    occupyingfactionname character varying(128) NOT NULL,
    owningfactionid bigint NOT NULL,
    owningfactionname character varying(128) NOT NULL,
    victorypoints integer NOT NULL,
    threshold integer NOT NULL,
    upload_id integer
);


ALTER TABLE public.uploader_facwarsystem OWNER TO emtools;

--
-- Name: uploader_facwarsystem_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_facwarsystem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_facwarsystem_id_seq OWNER TO emtools;

--
-- Name: uploader_facwarsystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_facwarsystem_id_seq OWNED BY uploader_facwarsystem.id;


--
-- Name: uploader_facwarsystemhistory; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_facwarsystemhistory (
    id integer NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    solarsystemid bigint NOT NULL,
    occupyingfactionid bigint NOT NULL,
    victorypoints integer NOT NULL,
    threshold integer NOT NULL,
    upload_id integer
);


ALTER TABLE public.uploader_facwarsystemhistory OWNER TO emtools;

--
-- Name: uploader_facwarsystemhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_facwarsystemhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_facwarsystemhistory_id_seq OWNER TO emtools;

--
-- Name: uploader_facwarsystemhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_facwarsystemhistory_id_seq OWNED BY uploader_facwarsystemhistory.id;


--
-- Name: uploader_markethistory; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_markethistory (
    id integer NOT NULL,
    upload_id integer NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    regionid bigint NOT NULL,
    typeid bigint NOT NULL,
    historydate date NOT NULL,
    lowprice double precision NOT NULL,
    highprice double precision NOT NULL,
    avgprice double precision NOT NULL,
    volume bigint NOT NULL,
    orders integer NOT NULL
);


ALTER TABLE public.uploader_markethistory OWNER TO emtools;

--
-- Name: uploader_markethistory_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_markethistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_markethistory_id_seq OWNER TO emtools;

--
-- Name: uploader_markethistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_markethistory_id_seq OWNED BY uploader_markethistory.id;


--
-- Name: uploader_markethistorylastupload; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_markethistorylastupload (
    id integer NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    regionid bigint NOT NULL,
    typeid bigint NOT NULL
);


ALTER TABLE public.uploader_markethistorylastupload OWNER TO emtools;

--
-- Name: uploader_markethistorylastupload_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_markethistorylastupload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_markethistorylastupload_id_seq OWNER TO emtools;

--
-- Name: uploader_markethistorylastupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_markethistorylastupload_id_seq OWNED BY uploader_markethistorylastupload.id;


--
-- Name: uploader_marketorder; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_marketorder (
    id integer NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    orderid bigint NOT NULL,
    stationid bigint NOT NULL,
    solarsystemid bigint NOT NULL,
    regionid bigint NOT NULL,
    volentered bigint NOT NULL,
    volremaining bigint NOT NULL,
    minvolume bigint NOT NULL,
    typeid bigint NOT NULL,
    range integer NOT NULL,
    duration integer NOT NULL,
    price double precision NOT NULL,
    bid boolean NOT NULL,
    issuedate timestamp with time zone NOT NULL,
    upload_id integer
);


ALTER TABLE public.uploader_marketorder OWNER TO emtools;

--
-- Name: uploader_marketorder_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_marketorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_marketorder_id_seq OWNER TO emtools;

--
-- Name: uploader_marketorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_marketorder_id_seq OWNED BY uploader_marketorder.id;


--
-- Name: uploader_marketorderlastupload; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_marketorderlastupload (
    id integer NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    regionid bigint NOT NULL,
    typeid bigint NOT NULL
);


ALTER TABLE public.uploader_marketorderlastupload OWNER TO emtools;

--
-- Name: uploader_marketorderlastupload_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_marketorderlastupload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_marketorderlastupload_id_seq OWNER TO emtools;

--
-- Name: uploader_marketorderlastupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_marketorderlastupload_id_seq OWNED BY uploader_marketorderlastupload.id;


--
-- Name: uploader_upload; Type: TABLE; Schema: public; Owner: emtools; Tablespace: 
--

CREATE TABLE uploader_upload (
    id integer NOT NULL,
    user_id integer NOT NULL,
    uploadtimestamp timestamp with time zone NOT NULL,
    cachetimestamp timestamp with time zone NOT NULL,
    method character varying(128) NOT NULL
);


ALTER TABLE public.uploader_upload OWNER TO emtools;

--
-- Name: uploader_upload_id_seq; Type: SEQUENCE; Schema: public; Owner: emtools
--

CREATE SEQUENCE uploader_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.uploader_upload_id_seq OWNER TO emtools;

--
-- Name: uploader_upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emtools
--

ALTER SEQUENCE uploader_upload_id_seq OWNED BY uploader_upload.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY ccpeve_apikey ALTER COLUMN id SET DEFAULT nextval('ccpeve_apikey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY ccpeve_cache ALTER COLUMN id SET DEFAULT nextval('ccpeve_cache_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY ccpeve_division ALTER COLUMN id SET DEFAULT nextval('ccpeve_division_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY channels_changelog ALTER COLUMN id SET DEFAULT nextval('channels_changelog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY channels_channel ALTER COLUMN id SET DEFAULT nextval('channels_channel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY corpreport_divisionconfig ALTER COLUMN id SET DEFAULT nextval('corpreport_divisionconfig_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY corpreport_reportcategory ALTER COLUMN id SET DEFAULT nextval('corpreport_reportcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY emadmin_lastupdate ALTER COLUMN id SET DEFAULT nextval('emadmin_lastupdate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY emadmin_logrecord ALTER COLUMN id SET DEFAULT nextval('emadmin_logrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY emadmin_schedule ALTER COLUMN id SET DEFAULT nextval('emadmin_schedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY emauth_authlog ALTER COLUMN id SET DEFAULT nextval('emauth_authlog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY emauth_authtoken ALTER COLUMN id SET DEFAULT nextval('emauth_authtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gmi_indexhistory ALTER COLUMN id SET DEFAULT nextval('gmi_indexhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gmi_upload ALTER COLUMN id SET DEFAULT nextval('gmi_upload_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_comment ALTER COLUMN id SET DEFAULT nextval('gts_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_state ALTER COLUMN id SET DEFAULT nextval('gts_state_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_ticket ALTER COLUMN id SET DEFAULT nextval('gts_ticket_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_tickettype ALTER COLUMN id SET DEFAULT nextval('gts_tickettype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_tickettype_users ALTER COLUMN id SET DEFAULT nextval('gts_tickettype_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY index_index ALTER COLUMN id SET DEFAULT nextval('index_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY index_indexhistory ALTER COLUMN id SET DEFAULT nextval('index_indexhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_account ALTER COLUMN id SET DEFAULT nextval('industry_account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_blueprintoriginal ALTER COLUMN id SET DEFAULT nextval('industry_blueprintoriginal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_journal ALTER COLUMN id SET DEFAULT nextval('industry_journal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_lastupdate ALTER COLUMN id SET DEFAULT nextval('industry_lastupdate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_marketorder ALTER COLUMN id SET DEFAULT nextval('industry_marketorder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_marketprice ALTER COLUMN id SET DEFAULT nextval('industry_marketprice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_pricelist ALTER COLUMN id SET DEFAULT nextval('industry_pricelist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_publicmarketorder ALTER COLUMN id SET DEFAULT nextval('industry_publicmarketorder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_stock ALTER COLUMN id SET DEFAULT nextval('industry_stock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_stocklevel ALTER COLUMN id SET DEFAULT nextval('industry_stocklevel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_stocklevel_watcher ALTER COLUMN id SET DEFAULT nextval('industry_stocklevel_watcher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_transaction ALTER COLUMN id SET DEFAULT nextval('industry_transaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_transactioninfo ALTER COLUMN id SET DEFAULT nextval('industry_transactioninfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_wantedmarketorder ALTER COLUMN id SET DEFAULT nextval('industry_wantedmarketorder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_alliance ALTER COLUMN id SET DEFAULT nextval('intel_alliance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change ALTER COLUMN id SET DEFAULT nextval('intel_change_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_changelog ALTER COLUMN id SET DEFAULT nextval('intel_changelog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_corporation ALTER COLUMN id SET DEFAULT nextval('intel_corporation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_edkfeed ALTER COLUMN id SET DEFAULT nextval('intel_edkfeed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_entity ALTER COLUMN id SET DEFAULT nextval('intel_entity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_faction ALTER COLUMN id SET DEFAULT nextval('intel_faction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_feed ALTER COLUMN id SET DEFAULT nextval('intel_feed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill ALTER COLUMN id SET DEFAULT nextval('intel_kill_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedalliances ALTER COLUMN id SET DEFAULT nextval('intel_kill_involvedalliances_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedcorps ALTER COLUMN id SET DEFAULT nextval('intel_kill_involvedcorps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedfactions ALTER COLUMN id SET DEFAULT nextval('intel_kill_involvedfactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedpilots ALTER COLUMN id SET DEFAULT nextval('intel_kill_involvedpilots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_pilot ALTER COLUMN id SET DEFAULT nextval('intel_pilot_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trace ALTER COLUMN id SET DEFAULT nextval('intel_trace_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trackedentity ALTER COLUMN id SET DEFAULT nextval('intel_trackedentity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY rc_change ALTER COLUMN id SET DEFAULT nextval('rc_change_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_character ALTER COLUMN id SET DEFAULT nextval('recruitment_character_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_implant ALTER COLUMN id SET DEFAULT nextval('recruitment_implant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_skill ALTER COLUMN id SET DEFAULT nextval('recruitment_skill_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_standing ALTER COLUMN id SET DEFAULT nextval('recruitment_standing_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_user ALTER COLUMN id SET DEFAULT nextval('recruitment_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY shop_message ALTER COLUMN id SET DEFAULT nextval('shop_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY shop_order ALTER COLUMN id SET DEFAULT nextval('shop_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY shop_salesoffice ALTER COLUMN id SET DEFAULT nextval('shop_salesoffice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY timezones_tzconfig ALTER COLUMN id SET DEFAULT nextval('timezones_tzconfig_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_authtoken ALTER COLUMN id SET DEFAULT nextval('uploader_authtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_corpfaction ALTER COLUMN id SET DEFAULT nextval('uploader_corpfaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_corpfactionhistory ALTER COLUMN id SET DEFAULT nextval('uploader_corpfactionhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_corpfactionhistory_uploads ALTER COLUMN id SET DEFAULT nextval('uploader_corpfactionhistory_uploads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_facwarsystem ALTER COLUMN id SET DEFAULT nextval('uploader_facwarsystem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_facwarsystemhistory ALTER COLUMN id SET DEFAULT nextval('uploader_facwarsystemhistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_markethistory ALTER COLUMN id SET DEFAULT nextval('uploader_markethistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_markethistorylastupload ALTER COLUMN id SET DEFAULT nextval('uploader_markethistorylastupload_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_marketorder ALTER COLUMN id SET DEFAULT nextval('uploader_marketorder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_marketorderlastupload ALTER COLUMN id SET DEFAULT nextval('uploader_marketorderlastupload_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_upload ALTER COLUMN id SET DEFAULT nextval('uploader_upload_id_seq'::regclass);


SET search_path = ccp, pg_catalog;

--
-- Name: agtagents_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY agtagents
    ADD CONSTRAINT agtagents_pkey PRIMARY KEY (agentid);


--
-- Name: agtagenttypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY agtagenttypes
    ADD CONSTRAINT agtagenttypes_pkey PRIMARY KEY (agenttypeid);


--
-- Name: agtresearchagents_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY agtresearchagents
    ADD CONSTRAINT agtresearchagents_pkey PRIMARY KEY (agentid, typeid);


--
-- Name: chrancestries_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY chrancestries
    ADD CONSTRAINT chrancestries_pkey PRIMARY KEY (ancestryid);


--
-- Name: chrattributes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY chrattributes
    ADD CONSTRAINT chrattributes_pkey PRIMARY KEY (attributeid);


--
-- Name: chrbloodlines_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY chrbloodlines
    ADD CONSTRAINT chrbloodlines_pkey PRIMARY KEY (bloodlineid);


--
-- Name: chrfactions_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY chrfactions
    ADD CONSTRAINT chrfactions_pkey PRIMARY KEY (factionid);


--
-- Name: chrraces_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY chrraces
    ADD CONSTRAINT chrraces_pkey PRIMARY KEY (raceid);


--
-- Name: crpactivities_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crpactivities
    ADD CONSTRAINT crpactivities_pkey PRIMARY KEY (activityid);


--
-- Name: crpnpccorporationdivisions_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crpnpccorporationdivisions
    ADD CONSTRAINT crpnpccorporationdivisions_pkey PRIMARY KEY (corporationid, divisionid);


--
-- Name: crpnpccorporationresearchfields_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crpnpccorporationresearchfields
    ADD CONSTRAINT crpnpccorporationresearchfields_pkey PRIMARY KEY (skillid, corporationid);


--
-- Name: crpnpccorporations_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crpnpccorporations
    ADD CONSTRAINT crpnpccorporations_pkey PRIMARY KEY (corporationid);


--
-- Name: crpnpccorporationtrades_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crpnpccorporationtrades
    ADD CONSTRAINT crpnpccorporationtrades_pkey PRIMARY KEY (corporationid, typeid);


--
-- Name: crpnpcdivisions_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crpnpcdivisions
    ADD CONSTRAINT crpnpcdivisions_pkey PRIMARY KEY (divisionid);


--
-- Name: crtcategories_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crtcategories
    ADD CONSTRAINT crtcategories_pkey PRIMARY KEY (categoryid);


--
-- Name: crtcertificates_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crtcertificates
    ADD CONSTRAINT crtcertificates_pkey PRIMARY KEY (certificateid);


--
-- Name: crtclasses_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crtclasses
    ADD CONSTRAINT crtclasses_pkey PRIMARY KEY (classid);


--
-- Name: crtrecommendations_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crtrecommendations
    ADD CONSTRAINT crtrecommendations_pkey PRIMARY KEY (recommendationid);


--
-- Name: crtrelationships_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY crtrelationships
    ADD CONSTRAINT crtrelationships_pkey PRIMARY KEY (relationshipid);


--
-- Name: dgmattributecategories_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY dgmattributecategories
    ADD CONSTRAINT dgmattributecategories_pkey PRIMARY KEY (categoryid);


--
-- Name: dgmattributetypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY dgmattributetypes
    ADD CONSTRAINT dgmattributetypes_pkey PRIMARY KEY (attributeid);


--
-- Name: dgmeffects_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY dgmeffects
    ADD CONSTRAINT dgmeffects_pkey PRIMARY KEY (effectid);


--
-- Name: dgmtypeattributes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY dgmtypeattributes
    ADD CONSTRAINT dgmtypeattributes_pkey PRIMARY KEY (typeid, attributeid);


--
-- Name: dgmtypeeffects_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY dgmtypeeffects
    ADD CONSTRAINT dgmtypeeffects_pkey PRIMARY KEY (typeid, effectid);


--
-- Name: eveunits_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY eveunits
    ADD CONSTRAINT eveunits_pkey PRIMARY KEY (unitid);


--
-- Name: invblueprinttypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invblueprinttypes
    ADD CONSTRAINT invblueprinttypes_pkey PRIMARY KEY (blueprinttypeid);


--
-- Name: invcategories_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invcategories
    ADD CONSTRAINT invcategories_pkey PRIMARY KEY (categoryid);


--
-- Name: invcontrabandtypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invcontrabandtypes
    ADD CONSTRAINT invcontrabandtypes_pkey PRIMARY KEY (factionid, typeid);


--
-- Name: invcontroltowerresourcepurposes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invcontroltowerresourcepurposes
    ADD CONSTRAINT invcontroltowerresourcepurposes_pkey PRIMARY KEY (purpose);


--
-- Name: invcontroltowerresources_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invcontroltowerresources
    ADD CONSTRAINT invcontroltowerresources_pkey PRIMARY KEY (controltowertypeid, resourcetypeid);


--
-- Name: invflags_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invflags
    ADD CONSTRAINT invflags_pkey PRIMARY KEY (flagid);


--
-- Name: invgroups_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invgroups
    ADD CONSTRAINT invgroups_pkey PRIMARY KEY (groupid);


--
-- Name: invitems_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invitems
    ADD CONSTRAINT invitems_pkey PRIMARY KEY (itemid);


--
-- Name: invmarketgroups_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invmarketgroups
    ADD CONSTRAINT invmarketgroups_pkey PRIMARY KEY (marketgroupid);


--
-- Name: invmetagroups_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invmetagroups
    ADD CONSTRAINT invmetagroups_pkey PRIMARY KEY (metagroupid);


--
-- Name: invmetatypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invmetatypes
    ADD CONSTRAINT invmetatypes_pkey PRIMARY KEY (typeid);


--
-- Name: invnames_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invnames
    ADD CONSTRAINT invnames_pkey PRIMARY KEY (itemid);


--
-- Name: invpositions_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invpositions
    ADD CONSTRAINT invpositions_pkey PRIMARY KEY (itemid);


--
-- Name: invtypematerials_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invtypematerials
    ADD CONSTRAINT invtypematerials_pkey PRIMARY KEY (typeid, materialtypeid);


--
-- Name: invtypereactions_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invtypereactions
    ADD CONSTRAINT invtypereactions_pkey PRIMARY KEY (reactiontypeid, input, typeid);


--
-- Name: invtypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invtypes
    ADD CONSTRAINT invtypes_pkey PRIMARY KEY (typeid);


--
-- Name: invuniquenames_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY invuniquenames
    ADD CONSTRAINT invuniquenames_pkey PRIMARY KEY (itemid);


--
-- Name: mapcelestialstatistics_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapcelestialstatistics
    ADD CONSTRAINT mapcelestialstatistics_pkey PRIMARY KEY (celestialid);


--
-- Name: mapconstellationjumps_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapconstellationjumps
    ADD CONSTRAINT mapconstellationjumps_pkey PRIMARY KEY (fromconstellationid, toconstellationid);


--
-- Name: mapconstellations_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapconstellations
    ADD CONSTRAINT mapconstellations_pkey PRIMARY KEY (constellationid);


--
-- Name: mapdenormalize_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapdenormalize
    ADD CONSTRAINT mapdenormalize_pkey PRIMARY KEY (itemid);


--
-- Name: mapjumps_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapjumps
    ADD CONSTRAINT mapjumps_pkey PRIMARY KEY (stargateid);


--
-- Name: maplandmarks_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY maplandmarks
    ADD CONSTRAINT maplandmarks_pkey PRIMARY KEY (landmarkid);


--
-- Name: maplocationscenes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY maplocationscenes
    ADD CONSTRAINT maplocationscenes_pkey PRIMARY KEY (locationid);


--
-- Name: maplocationwormholeclasses_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY maplocationwormholeclasses
    ADD CONSTRAINT maplocationwormholeclasses_pkey PRIMARY KEY (locationid);


--
-- Name: mapregionjumps_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapregionjumps
    ADD CONSTRAINT mapregionjumps_pkey PRIMARY KEY (fromregionid, toregionid);


--
-- Name: mapregions_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapregions
    ADD CONSTRAINT mapregions_pkey PRIMARY KEY (regionid);


--
-- Name: mapsolarsystemjumps_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapsolarsystemjumps
    ADD CONSTRAINT mapsolarsystemjumps_pkey PRIMARY KEY (fromsolarsystemid, tosolarsystemid);


--
-- Name: mapsolarsystems_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapsolarsystems
    ADD CONSTRAINT mapsolarsystems_pkey PRIMARY KEY (solarsystemid);


--
-- Name: mapuniverse_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY mapuniverse
    ADD CONSTRAINT mapuniverse_pkey PRIMARY KEY (universeid);


--
-- Name: planetschematics_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY planetschematics
    ADD CONSTRAINT planetschematics_pkey PRIMARY KEY (schematicid);


--
-- Name: planetschematicspinmap_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY planetschematicspinmap
    ADD CONSTRAINT planetschematicspinmap_pkey PRIMARY KEY (schematicid, pintypeid);


--
-- Name: planetschematicstypemap_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY planetschematicstypemap
    ADD CONSTRAINT planetschematicstypemap_pkey PRIMARY KEY (schematicid, typeid);


--
-- Name: ramactivities_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ramactivities
    ADD CONSTRAINT ramactivities_pkey PRIMARY KEY (activityid);


--
-- Name: ramassemblylines_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ramassemblylines
    ADD CONSTRAINT ramassemblylines_pkey PRIMARY KEY (assemblylineid);


--
-- Name: ramassemblylinestations_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ramassemblylinestations
    ADD CONSTRAINT ramassemblylinestations_pkey PRIMARY KEY (stationid, assemblylinetypeid);


--
-- Name: ramassemblylinetypedetailpercategory_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ramassemblylinetypedetailpercategory
    ADD CONSTRAINT ramassemblylinetypedetailpercategory_pkey PRIMARY KEY (assemblylinetypeid, categoryid);


--
-- Name: ramassemblylinetypedetailpergroup_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ramassemblylinetypedetailpergroup
    ADD CONSTRAINT ramassemblylinetypedetailpergroup_pkey PRIMARY KEY (assemblylinetypeid, groupid);


--
-- Name: ramassemblylinetypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ramassemblylinetypes
    ADD CONSTRAINT ramassemblylinetypes_pkey PRIMARY KEY (assemblylinetypeid);


--
-- Name: raminstallationtypecontents_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY raminstallationtypecontents
    ADD CONSTRAINT raminstallationtypecontents_pkey PRIMARY KEY (installationtypeid, assemblylinetypeid);


--
-- Name: ramtyperequirements_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ramtyperequirements
    ADD CONSTRAINT ramtyperequirements_pkey PRIMARY KEY (typeid, activityid, requiredtypeid);


--
-- Name: staoperations_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY staoperations
    ADD CONSTRAINT staoperations_pkey PRIMARY KEY (operationid);


--
-- Name: staoperationservices_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY staoperationservices
    ADD CONSTRAINT staoperationservices_pkey PRIMARY KEY (operationid, serviceid);


--
-- Name: staservices_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY staservices
    ADD CONSTRAINT staservices_pkey PRIMARY KEY (serviceid);


--
-- Name: stastations_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY stastations
    ADD CONSTRAINT stastations_pkey PRIMARY KEY (stationid);


--
-- Name: stastationtypes_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY stastationtypes
    ADD CONSTRAINT stastationtypes_pkey PRIMARY KEY (stationtypeid);


--
-- Name: trntranslationcolumns_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY trntranslationcolumns
    ADD CONSTRAINT trntranslationcolumns_pkey PRIMARY KEY (tcid);


--
-- Name: trntranslationlanguages_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY trntranslationlanguages
    ADD CONSTRAINT trntranslationlanguages_pkey PRIMARY KEY (numericlanguageid);


--
-- Name: trntranslations_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY trntranslations
    ADD CONSTRAINT trntranslations_pkey PRIMARY KEY (tcid, keyid, languageid);


--
-- Name: warcombatzones_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY warcombatzones
    ADD CONSTRAINT warcombatzones_pkey PRIMARY KEY (combatzoneid);


--
-- Name: warcombatzonesystems_pkey; Type: CONSTRAINT; Schema: ccp; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY warcombatzonesystems
    ADD CONSTRAINT warcombatzonesystems_pkey PRIMARY KEY (solarsystemid);


SET search_path = public, pg_catalog;

--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_message_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: ccpeve_apikey_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ccpeve_apikey
    ADD CONSTRAINT ccpeve_apikey_pkey PRIMARY KEY (id);


--
-- Name: ccpeve_cache_host_path_params_unique; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ccpeve_cache
    ADD CONSTRAINT ccpeve_cache_host_path_params_unique UNIQUE (host, path, params);


--
-- Name: ccpeve_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ccpeve_cache
    ADD CONSTRAINT ccpeve_cache_pkey PRIMARY KEY (id);


--
-- Name: ccpeve_division_apitimestamp_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ccpeve_division
    ADD CONSTRAINT ccpeve_division_apitimestamp_key UNIQUE (apitimestamp, ownerid, "accountKey");


--
-- Name: ccpeve_division_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY ccpeve_division
    ADD CONSTRAINT ccpeve_division_pkey PRIMARY KEY (id);


--
-- Name: channels_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY channels_changelog
    ADD CONSTRAINT channels_changelog_pkey PRIMARY KEY (id);


--
-- Name: channels_channel_name_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY channels_channel
    ADD CONSTRAINT channels_channel_name_key UNIQUE (name);


--
-- Name: channels_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY channels_channel
    ADD CONSTRAINT channels_channel_pkey PRIMARY KEY (id);


--
-- Name: corpreport_blueprintoriginal_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_blueprintoriginal
    ADD CONSTRAINT corpreport_blueprintoriginal_pkey PRIMARY KEY (id);


--
-- Name: corpreport_divisionconfig_account_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY corpreport_divisionconfig
    ADD CONSTRAINT corpreport_divisionconfig_account_id_key UNIQUE (division_id);


--
-- Name: corpreport_divisionconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY corpreport_divisionconfig
    ADD CONSTRAINT corpreport_divisionconfig_pkey PRIMARY KEY (id);


--
-- Name: corpreport_reportcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY corpreport_reportcategory
    ADD CONSTRAINT corpreport_reportcategory_pkey PRIMARY KEY (id);


--
-- Name: corpreport_reportcategory_type_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY corpreport_reportcategory
    ADD CONSTRAINT corpreport_reportcategory_type_id_key UNIQUE (type_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: emadmin_lastupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY emadmin_lastupdate
    ADD CONSTRAINT emadmin_lastupdate_pkey PRIMARY KEY (id);


--
-- Name: emadmin_logrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY emadmin_logrecord
    ADD CONSTRAINT emadmin_logrecord_pkey PRIMARY KEY (id);


--
-- Name: emadmin_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY emadmin_schedule
    ADD CONSTRAINT emadmin_schedule_pkey PRIMARY KEY (id);


--
-- Name: emauth_authlog_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY emauth_authlog
    ADD CONSTRAINT emauth_authlog_pkey PRIMARY KEY (id);


--
-- Name: emauth_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY emauth_authtoken
    ADD CONSTRAINT emauth_authtoken_pkey PRIMARY KEY (id);


--
-- Name: emauth_authtoken_user_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY emauth_authtoken
    ADD CONSTRAINT emauth_authtoken_user_id_key UNIQUE (user_id);


--
-- Name: emauth_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY emauth_profile
    ADD CONSTRAINT emauth_profile_pkey PRIMARY KEY (user_id);


--
-- Name: gmi_index_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gmi_index
    ADD CONSTRAINT gmi_index_pkey PRIMARY KEY (latest_id);


--
-- Name: gmi_indexhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gmi_indexhistory
    ADD CONSTRAINT gmi_indexhistory_pkey PRIMARY KEY (id);


--
-- Name: gmi_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gmi_upload
    ADD CONSTRAINT gmi_upload_pkey PRIMARY KEY (id);


--
-- Name: gts_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gts_comment
    ADD CONSTRAINT gts_comment_pkey PRIMARY KEY (id);


--
-- Name: gts_state_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gts_state
    ADD CONSTRAINT gts_state_pkey PRIMARY KEY (id);


--
-- Name: gts_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gts_ticket
    ADD CONSTRAINT gts_ticket_pkey PRIMARY KEY (id);


--
-- Name: gts_tickettype_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gts_tickettype
    ADD CONSTRAINT gts_tickettype_pkey PRIMARY KEY (id);


--
-- Name: gts_tickettype_users_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gts_tickettype_users
    ADD CONSTRAINT gts_tickettype_users_pkey PRIMARY KEY (id);


--
-- Name: gts_tickettype_users_tickettype_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY gts_tickettype_users
    ADD CONSTRAINT gts_tickettype_users_tickettype_id_key UNIQUE (tickettype_id, user_id);


--
-- Name: index_index_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY index_index
    ADD CONSTRAINT index_index_pkey PRIMARY KEY (id);


--
-- Name: index_indexhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY index_indexhistory
    ADD CONSTRAINT index_indexhistory_pkey PRIMARY KEY (id);


--
-- Name: industry_account_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_account
    ADD CONSTRAINT industry_account_pkey PRIMARY KEY (id);


--
-- Name: industry_journal_journalid_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_journal
    ADD CONSTRAINT industry_journal_journalid_key UNIQUE (journalid);


--
-- Name: industry_journal_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_journal
    ADD CONSTRAINT industry_journal_pkey PRIMARY KEY (id);


--
-- Name: industry_lastupdate_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_lastupdate
    ADD CONSTRAINT industry_lastupdate_pkey PRIMARY KEY (id);


--
-- Name: industry_marketorder_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_marketorder
    ADD CONSTRAINT industry_marketorder_pkey PRIMARY KEY (id);


--
-- Name: industry_marketprice_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_marketprice
    ADD CONSTRAINT industry_marketprice_pkey PRIMARY KEY (id);


--
-- Name: industry_pricelist_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_pricelist
    ADD CONSTRAINT industry_pricelist_pkey PRIMARY KEY (id);


--
-- Name: industry_pricelist_typeid_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_pricelist
    ADD CONSTRAINT industry_pricelist_typeid_key UNIQUE (typeid);


--
-- Name: industry_publicmarketorder_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_publicmarketorder
    ADD CONSTRAINT industry_publicmarketorder_pkey PRIMARY KEY (id);


--
-- Name: industry_stock_level_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_stock
    ADD CONSTRAINT industry_stock_level_id_key UNIQUE (level_id);


--
-- Name: industry_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_stock
    ADD CONSTRAINT industry_stock_pkey PRIMARY KEY (id);


--
-- Name: industry_stock_typeid_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_stock
    ADD CONSTRAINT industry_stock_typeid_key UNIQUE (typeid, stationid);


--
-- Name: industry_stocklevel_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_stocklevel
    ADD CONSTRAINT industry_stocklevel_pkey PRIMARY KEY (id);


--
-- Name: industry_stocklevel_typeid_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_stocklevel
    ADD CONSTRAINT industry_stocklevel_typeid_key UNIQUE (typeid, stationid);


--
-- Name: industry_stocklevel_watcher_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_stocklevel_watcher
    ADD CONSTRAINT industry_stocklevel_watcher_pkey PRIMARY KEY (id);


--
-- Name: industry_stocklevel_watcher_stocklevel_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_stocklevel_watcher
    ADD CONSTRAINT industry_stocklevel_watcher_stocklevel_id_key UNIQUE (stocklevel_id, user_id);


--
-- Name: industry_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_transaction
    ADD CONSTRAINT industry_transaction_pkey PRIMARY KEY (id);


--
-- Name: industry_transaction_transactionid_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_transaction
    ADD CONSTRAINT industry_transaction_transactionid_key UNIQUE (transactionid);


--
-- Name: industry_transactioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_transactioninfo
    ADD CONSTRAINT industry_transactioninfo_pkey PRIMARY KEY (id);


--
-- Name: industry_transactioninfo_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_transactioninfo
    ADD CONSTRAINT industry_transactioninfo_transaction_id_key UNIQUE (transaction_id);


--
-- Name: industry_wantedmarketorder_characterid_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_wantedmarketorder
    ADD CONSTRAINT industry_wantedmarketorder_characterid_key UNIQUE (characterid, stationid, typeid);


--
-- Name: industry_wantedmarketorder_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY industry_wantedmarketorder
    ADD CONSTRAINT industry_wantedmarketorder_pkey PRIMARY KEY (id);


--
-- Name: intel_alliance_allianceid_unique; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_alliance
    ADD CONSTRAINT intel_alliance_allianceid_unique UNIQUE (allianceid);


--
-- Name: intel_alliance_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_alliance
    ADD CONSTRAINT intel_alliance_pkey PRIMARY KEY (id);


--
-- Name: intel_change_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_pkey PRIMARY KEY (id);


--
-- Name: intel_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_changelog
    ADD CONSTRAINT intel_changelog_pkey PRIMARY KEY (id);


--
-- Name: intel_corporation_corporationid_unique; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_corporation
    ADD CONSTRAINT intel_corporation_corporationid_unique UNIQUE (corporationid);


--
-- Name: intel_corporation_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_corporation
    ADD CONSTRAINT intel_corporation_pkey PRIMARY KEY (id);


--
-- Name: intel_edkfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_edkfeed
    ADD CONSTRAINT intel_edkfeed_pkey PRIMARY KEY (id);


--
-- Name: intel_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_entity
    ADD CONSTRAINT intel_entity_pkey PRIMARY KEY (id);


--
-- Name: intel_faction_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_faction
    ADD CONSTRAINT intel_faction_pkey PRIMARY KEY (id);


--
-- Name: intel_feed_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_feed
    ADD CONSTRAINT intel_feed_pkey PRIMARY KEY (id);


--
-- Name: intel_kill_hash_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill
    ADD CONSTRAINT intel_kill_hash_key UNIQUE (hash);


--
-- Name: intel_kill_involvedalliances_kill_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedalliances
    ADD CONSTRAINT intel_kill_involvedalliances_kill_id_key UNIQUE (kill_id, alliance_id);


--
-- Name: intel_kill_involvedalliances_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedalliances
    ADD CONSTRAINT intel_kill_involvedalliances_pkey PRIMARY KEY (id);


--
-- Name: intel_kill_involvedcorps_kill_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedcorps
    ADD CONSTRAINT intel_kill_involvedcorps_kill_id_key UNIQUE (kill_id, corporation_id);


--
-- Name: intel_kill_involvedcorps_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedcorps
    ADD CONSTRAINT intel_kill_involvedcorps_pkey PRIMARY KEY (id);


--
-- Name: intel_kill_involvedfactions_kill_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedfactions
    ADD CONSTRAINT intel_kill_involvedfactions_kill_id_key UNIQUE (kill_id, faction_id);


--
-- Name: intel_kill_involvedfactions_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedfactions
    ADD CONSTRAINT intel_kill_involvedfactions_pkey PRIMARY KEY (id);


--
-- Name: intel_kill_involvedpilots_kill_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedpilots
    ADD CONSTRAINT intel_kill_involvedpilots_kill_id_key UNIQUE (kill_id, pilot_id);


--
-- Name: intel_kill_involvedpilots_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill_involvedpilots
    ADD CONSTRAINT intel_kill_involvedpilots_pkey PRIMARY KEY (id);


--
-- Name: intel_kill_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_kill
    ADD CONSTRAINT intel_kill_pkey PRIMARY KEY (id);


--
-- Name: intel_pilot_characterid_unique; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_pilot
    ADD CONSTRAINT intel_pilot_characterid_unique UNIQUE (characterid);


--
-- Name: intel_pilot_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_pilot
    ADD CONSTRAINT intel_pilot_pkey PRIMARY KEY (id);


--
-- Name: intel_trace_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_trace
    ADD CONSTRAINT intel_trace_pkey PRIMARY KEY (id);


--
-- Name: intel_trackedentity_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY intel_trackedentity
    ADD CONSTRAINT intel_trackedentity_pkey PRIMARY KEY (id);


--
-- Name: rc_change_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY rc_change
    ADD CONSTRAINT rc_change_pkey PRIMARY KEY (id);


--
-- Name: recruitment_character_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY recruitment_character
    ADD CONSTRAINT recruitment_character_pkey PRIMARY KEY (id);


--
-- Name: recruitment_implant_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY recruitment_implant
    ADD CONSTRAINT recruitment_implant_pkey PRIMARY KEY (id);


--
-- Name: recruitment_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY recruitment_skill
    ADD CONSTRAINT recruitment_skill_pkey PRIMARY KEY (id);


--
-- Name: recruitment_standing_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY recruitment_standing
    ADD CONSTRAINT recruitment_standing_pkey PRIMARY KEY (id);


--
-- Name: recruitment_user_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY recruitment_user
    ADD CONSTRAINT recruitment_user_pkey PRIMARY KEY (id);


--
-- Name: shop_message_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY shop_message
    ADD CONSTRAINT shop_message_pkey PRIMARY KEY (id);


--
-- Name: shop_order_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY shop_order
    ADD CONSTRAINT shop_order_pkey PRIMARY KEY (id);


--
-- Name: shop_orderhandler_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY shop_orderhandler
    ADD CONSTRAINT shop_orderhandler_pkey PRIMARY KEY (user_id);


--
-- Name: shop_salesoffice_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY shop_salesoffice
    ADD CONSTRAINT shop_salesoffice_pkey PRIMARY KEY (id);


--
-- Name: timezones_tzconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY timezones_tzconfig
    ADD CONSTRAINT timezones_tzconfig_pkey PRIMARY KEY (id);


--
-- Name: uploader_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_authtoken
    ADD CONSTRAINT uploader_authtoken_pkey PRIMARY KEY (id);


--
-- Name: uploader_authtoken_tokenstring_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_authtoken
    ADD CONSTRAINT uploader_authtoken_tokenstring_key UNIQUE (tokenstring);


--
-- Name: uploader_corpfaction_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_corpfaction
    ADD CONSTRAINT uploader_corpfaction_pkey PRIMARY KEY (id);


--
-- Name: uploader_corpfactionhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_corpfactionhistory
    ADD CONSTRAINT uploader_corpfactionhistory_pkey PRIMARY KEY (id);


--
-- Name: uploader_corpfactionhistory_uploads_corpfactionhistory_id_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_corpfactionhistory_uploads
    ADD CONSTRAINT uploader_corpfactionhistory_uploads_corpfactionhistory_id_key UNIQUE (corpfactionhistory_id, upload_id);


--
-- Name: uploader_corpfactionhistory_uploads_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_corpfactionhistory_uploads
    ADD CONSTRAINT uploader_corpfactionhistory_uploads_pkey PRIMARY KEY (id);


--
-- Name: uploader_facwarsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_facwarsystem
    ADD CONSTRAINT uploader_facwarsystem_pkey PRIMARY KEY (id);


--
-- Name: uploader_facwarsystemhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_facwarsystemhistory
    ADD CONSTRAINT uploader_facwarsystemhistory_pkey PRIMARY KEY (id);


--
-- Name: uploader_markethistory_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_markethistory
    ADD CONSTRAINT uploader_markethistory_pkey PRIMARY KEY (id);


--
-- Name: uploader_markethistory_regionid_key; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_markethistory
    ADD CONSTRAINT uploader_markethistory_regionid_key UNIQUE (regionid, typeid, historydate);


--
-- Name: uploader_markethistorylastupload_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_markethistorylastupload
    ADD CONSTRAINT uploader_markethistorylastupload_pkey PRIMARY KEY (id);


--
-- Name: uploader_marketorder_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_marketorder
    ADD CONSTRAINT uploader_marketorder_pkey PRIMARY KEY (id);


--
-- Name: uploader_marketorderlastupload_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_marketorderlastupload
    ADD CONSTRAINT uploader_marketorderlastupload_pkey PRIMARY KEY (id);


--
-- Name: uploader_marketorderlastupload_typeid_regionid_unique; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_marketorderlastupload
    ADD CONSTRAINT uploader_marketorderlastupload_typeid_regionid_unique UNIQUE (typeid, regionid);


--
-- Name: uploader_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: emtools; Tablespace: 
--

ALTER TABLE ONLY uploader_upload
    ADD CONSTRAINT uploader_upload_pkey PRIMARY KEY (id);


SET search_path = ccp, pg_catalog;

--
-- Name: agtagents_corporationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX agtagents_corporationid_idx ON agtagents USING btree (corporationid);


--
-- Name: agtagents_locationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX agtagents_locationid_idx ON agtagents USING btree (locationid);


--
-- Name: agtresearchagents_typeid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX agtresearchagents_typeid_idx ON agtresearchagents USING btree (typeid);


--
-- Name: crtcertificates_categoryid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX crtcertificates_categoryid_idx ON crtcertificates USING btree (categoryid);


--
-- Name: crtcertificates_classid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX crtcertificates_classid_idx ON crtcertificates USING btree (classid);


--
-- Name: crtrecommendations_certificateid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX crtrecommendations_certificateid_idx ON crtrecommendations USING btree (certificateid);


--
-- Name: crtrecommendations_shiptypeid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX crtrecommendations_shiptypeid_idx ON crtrecommendations USING btree (shiptypeid);


--
-- Name: crtrelationships_childid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX crtrelationships_childid_idx ON crtrelationships USING btree (childid);


--
-- Name: crtrelationships_parentid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX crtrelationships_parentid_idx ON crtrelationships USING btree (parentid);


--
-- Name: invcontrabandtypes_typeid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX invcontrabandtypes_typeid_idx ON invcontrabandtypes USING btree (typeid);


--
-- Name: invgroups_categoryid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX invgroups_categoryid_idx ON invgroups USING btree (categoryid);


--
-- Name: invitems_1_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX invitems_1_idx ON invitems USING btree (ownerid, locationid);


--
-- Name: invitems_locationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX invitems_locationid_idx ON invitems USING btree (locationid);


--
-- Name: invtypes_groupid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX invtypes_groupid_idx ON invtypes USING btree (groupid);


--
-- Name: invuniquenames_1_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX invuniquenames_1_idx ON invuniquenames USING btree (groupid, itemname);


--
-- Name: mapconstellationjumps_fromregionid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapconstellationjumps_fromregionid_idx ON mapconstellationjumps USING btree (fromregionid);


--
-- Name: mapconstellations_regionid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapconstellations_regionid_idx ON mapconstellations USING btree (regionid);


--
-- Name: mapdenormalize_1_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapdenormalize_1_idx ON mapdenormalize USING btree (groupid, regionid);


--
-- Name: mapdenormalize_constellationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapdenormalize_constellationid_idx ON mapdenormalize USING btree (constellationid);


--
-- Name: mapdenormalize_orbitid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapdenormalize_orbitid_idx ON mapdenormalize USING btree (orbitid);


--
-- Name: mapdenormalize_regionid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapdenormalize_regionid_idx ON mapdenormalize USING btree (regionid);


--
-- Name: mapdenormalize_solarsystemid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapdenormalize_solarsystemid_idx ON mapdenormalize USING btree (solarsystemid);


--
-- Name: mapsolarsystemjumps_fromconstellationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapsolarsystemjumps_fromconstellationid_idx ON mapsolarsystemjumps USING btree (fromconstellationid);


--
-- Name: mapsolarsystemjumps_fromregionid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapsolarsystemjumps_fromregionid_idx ON mapsolarsystemjumps USING btree (fromregionid);


--
-- Name: mapsolarsystems_constellationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapsolarsystems_constellationid_idx ON mapsolarsystems USING btree (constellationid);


--
-- Name: mapsolarsystems_regionid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapsolarsystems_regionid_idx ON mapsolarsystems USING btree (regionid);


--
-- Name: mapsolarsystems_security_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX mapsolarsystems_security_idx ON mapsolarsystems USING btree (security);


--
-- Name: ramassemblylines_containerid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX ramassemblylines_containerid_idx ON ramassemblylines USING btree (containerid);


--
-- Name: ramassemblylines_ownerid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX ramassemblylines_ownerid_idx ON ramassemblylines USING btree (ownerid);


--
-- Name: ramassemblylinestations_ownerid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX ramassemblylinestations_ownerid_idx ON ramassemblylinestations USING btree (ownerid);


--
-- Name: ramassemblylinestations_regionid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX ramassemblylinestations_regionid_idx ON ramassemblylinestations USING btree (regionid);


--
-- Name: stastations_constellationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX stastations_constellationid_idx ON stastations USING btree (constellationid);


--
-- Name: stastations_corporationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX stastations_corporationid_idx ON stastations USING btree (corporationid);


--
-- Name: stastations_operationid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX stastations_operationid_idx ON stastations USING btree (operationid);


--
-- Name: stastations_regionid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX stastations_regionid_idx ON stastations USING btree (regionid);


--
-- Name: stastations_solarsystemid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX stastations_solarsystemid_idx ON stastations USING btree (solarsystemid);


--
-- Name: stastations_stationtypeid_idx; Type: INDEX; Schema: ccp; Owner: emtools; Tablespace: 
--

CREATE INDEX stastations_stationtypeid_idx ON stastations USING btree (stationtypeid);


SET search_path = public, pg_catalog;

--
-- Name: auth_message_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX auth_message_user_id ON auth_message USING btree (user_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: channels_changelog_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX channels_changelog_user_id ON channels_changelog USING btree (user_id);


--
-- Name: corpreport_blueprintoriginal_blueprinttypeid_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX corpreport_blueprintoriginal_blueprinttypeid_id ON industry_blueprintoriginal USING btree (typeid);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: gmi_upload_timestamp_idx; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gmi_upload_timestamp_idx ON gmi_upload USING btree ("timestamp");


--
-- Name: gmi_upload_typeid_idx; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gmi_upload_typeid_idx ON gmi_upload USING btree (typeid);


--
-- Name: gmi_upload_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gmi_upload_user_id ON gmi_upload USING btree (user_id);


--
-- Name: gts_comment_author_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_comment_author_id ON gts_comment USING btree (author_id);


--
-- Name: gts_comment_ticket_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_comment_ticket_id ON gts_comment USING btree (ticket_id);


--
-- Name: gts_ticket_assignedto_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_ticket_assignedto_id ON gts_ticket USING btree (assignedto_id);


--
-- Name: gts_ticket_createdby_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_ticket_createdby_id ON gts_ticket USING btree (createdby_id);


--
-- Name: gts_ticket_editedby_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_ticket_editedby_id ON gts_ticket USING btree (editedby_id);


--
-- Name: gts_ticket_state_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_ticket_state_id ON gts_ticket USING btree (state_id);


--
-- Name: gts_ticket_type_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_ticket_type_id ON gts_ticket USING btree (type_id);


--
-- Name: gts_tickettype_users_tickettype_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_tickettype_users_tickettype_id ON gts_tickettype_users USING btree (tickettype_id);


--
-- Name: gts_tickettype_users_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX gts_tickettype_users_user_id ON gts_tickettype_users USING btree (user_id);


--
-- Name: industry_stock_price_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX industry_stock_price_id ON industry_stock USING btree (price_id);


--
-- Name: industry_transactioninfo_account_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX industry_transactioninfo_account_id ON industry_transactioninfo USING btree (account_id);


--
-- Name: intel_change_alliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_alliance_id ON intel_change USING btree (alliance_id);


--
-- Name: intel_change_corporation_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_corporation_id ON intel_change USING btree (corporation_id);


--
-- Name: intel_change_newalliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_newalliance_id ON intel_change USING btree (newalliance_id);


--
-- Name: intel_change_newcorp_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_newcorp_id ON intel_change USING btree (newcorp_id);


--
-- Name: intel_change_newfaction_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_newfaction_id ON intel_change USING btree (newfaction_id);


--
-- Name: intel_change_oldalliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_oldalliance_id ON intel_change USING btree (oldalliance_id);


--
-- Name: intel_change_oldcorp_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_oldcorp_id ON intel_change USING btree (oldcorp_id);


--
-- Name: intel_change_oldfaction_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_oldfaction_id ON intel_change USING btree (oldfaction_id);


--
-- Name: intel_change_pilot_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_change_pilot_id ON intel_change USING btree (pilot_id);


--
-- Name: intel_changelog_newalliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_changelog_newalliance_id ON intel_changelog USING btree (newalliance_id);


--
-- Name: intel_changelog_newcorp_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_changelog_newcorp_id ON intel_changelog USING btree (newcorp_id);


--
-- Name: intel_changelog_oldalliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_changelog_oldalliance_id ON intel_changelog USING btree (oldalliance_id);


--
-- Name: intel_changelog_oldcorp_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_changelog_oldcorp_id ON intel_changelog USING btree (oldcorp_id);


--
-- Name: intel_changelog_pilot_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_changelog_pilot_id ON intel_changelog USING btree (pilot_id);


--
-- Name: intel_corporation_alliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_corporation_alliance_id ON intel_corporation USING btree (alliance_id);


--
-- Name: intel_entity_faction_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_entity_faction_id ON intel_entity USING btree (faction_id);


--
-- Name: intel_entity_itemid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_entity_itemid ON intel_entity USING btree (itemid);


--
-- Name: intel_entity_name; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_entity_name ON intel_entity USING btree (name);


--
-- Name: intel_entity_name_key; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE UNIQUE INDEX intel_entity_name_key ON intel_entity USING btree (entitytype, lower((name)::text));


--
-- Name: intel_entity_name_like; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_entity_name_like ON intel_entity USING btree (name varchar_pattern_ops);


--
-- Name: intel_entity_parent_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_entity_parent_id ON intel_entity USING btree (parent_id);


--
-- Name: intel_kill_involved_added_idx; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_kill_involved_added_idx ON intel_kill USING btree (involved_added);


--
-- Name: intel_kill_system_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_kill_system_id ON intel_kill USING btree (system_id);


--
-- Name: intel_kill_timestamp; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_kill_timestamp ON intel_kill USING btree ("timestamp");


--
-- Name: intel_pilot_alliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_pilot_alliance_id ON intel_pilot USING btree (alliance_id);


--
-- Name: intel_pilot_corporation_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_pilot_corporation_id ON intel_pilot USING btree (corporation_id);


--
-- Name: intel_trace_alliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_trace_alliance_id ON intel_trace USING btree (alliance_id);


--
-- Name: intel_trace_corporation_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_trace_corporation_id ON intel_trace USING btree (corporation_id);


--
-- Name: intel_trace_pilot_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_trace_pilot_id ON intel_trace USING btree (pilot_id);


--
-- Name: intel_trace_submitter_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_trace_submitter_id ON intel_trace USING btree (submitter_id);


--
-- Name: intel_trackedentity_alliance_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_trackedentity_alliance_id ON intel_trackedentity USING btree (alliance_id);


--
-- Name: intel_trackedentity_corporation_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX intel_trackedentity_corporation_id ON intel_trackedentity USING btree (corporation_id);


--
-- Name: recruitment_character_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX recruitment_character_user_id ON recruitment_character USING btree (user_id);


--
-- Name: recruitment_implant_character_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX recruitment_implant_character_id ON recruitment_implant USING btree (character_id);


--
-- Name: recruitment_skill_character_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX recruitment_skill_character_id ON recruitment_skill USING btree (character_id);


--
-- Name: recruitment_standing_character_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX recruitment_standing_character_id ON recruitment_standing USING btree (character_id);


--
-- Name: shop_message_handler_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX shop_message_handler_id ON shop_message USING btree (handler_id);


--
-- Name: shop_order_handler_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX shop_order_handler_id ON shop_order USING btree (handler_id);


--
-- Name: shop_order_office_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX shop_order_office_id ON shop_order USING btree (office_id);


--
-- Name: timezones_tzconfig_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX timezones_tzconfig_user_id ON timezones_tzconfig USING btree (user_id);


--
-- Name: uploader_authtoken_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_authtoken_user_id ON uploader_authtoken USING btree (user_id);


--
-- Name: uploader_corpfaction_submitter_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_corpfaction_submitter_id ON uploader_corpfaction USING btree (submitter_id);


--
-- Name: uploader_corpfactionhistory_uploads_corpfactionhistory_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_corpfactionhistory_uploads_corpfactionhistory_id ON uploader_corpfactionhistory_uploads USING btree (corpfactionhistory_id);


--
-- Name: uploader_corpfactionhistory_uploads_upload_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_corpfactionhistory_uploads_upload_id ON uploader_corpfactionhistory_uploads USING btree (upload_id);


--
-- Name: uploader_markethistory_historydate; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_markethistory_historydate ON uploader_markethistory USING btree (historydate);


--
-- Name: uploader_markethistory_regionid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_markethistory_regionid ON uploader_markethistory USING btree (regionid);


--
-- Name: uploader_markethistory_typeid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_markethistory_typeid ON uploader_markethistory USING btree (typeid);


--
-- Name: uploader_markethistory_upload_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_markethistory_upload_id ON uploader_markethistory USING btree (upload_id);


--
-- Name: uploader_markethistorylastupload_regionid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_markethistorylastupload_regionid ON uploader_markethistorylastupload USING btree (regionid);


--
-- Name: uploader_markethistorylastupload_typeid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_markethistorylastupload_typeid ON uploader_markethistorylastupload USING btree (typeid);


--
-- Name: uploader_markethistorylastupload_typeid_regionid_unique_idx; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE UNIQUE INDEX uploader_markethistorylastupload_typeid_regionid_unique_idx ON uploader_markethistorylastupload USING btree (regionid, typeid);


--
-- Name: uploader_marketorder_regionid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_marketorder_regionid ON uploader_marketorder USING btree (regionid);


--
-- Name: uploader_marketorder_solarsystemid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_marketorder_solarsystemid ON uploader_marketorder USING btree (solarsystemid);


--
-- Name: uploader_marketorder_stationid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_marketorder_stationid ON uploader_marketorder USING btree (stationid);


--
-- Name: uploader_marketorder_typeid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_marketorder_typeid ON uploader_marketorder USING btree (typeid);


--
-- Name: uploader_marketorderlastupload_regionid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_marketorderlastupload_regionid ON uploader_marketorderlastupload USING btree (regionid);


--
-- Name: uploader_marketorderlastupload_typeid; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_marketorderlastupload_typeid ON uploader_marketorderlastupload USING btree (typeid);


--
-- Name: uploader_upload_user_id; Type: INDEX; Schema: public; Owner: emtools; Tablespace: 
--

CREATE INDEX uploader_upload_user_id ON uploader_upload USING btree (user_id);


--
-- Name: auth_group_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_message
    ADD CONSTRAINT auth_message_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: channels_changelog_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY channels_changelog
    ADD CONSTRAINT channels_changelog_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_5c269194288599e6; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_5c269194288599e6 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_6bc81a32728de91f; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_6bc81a32728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: corpfactionhistory_id_refs_id_7e44977c; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_corpfactionhistory_uploads
    ADD CONSTRAINT corpfactionhistory_id_refs_id_7e44977c FOREIGN KEY (corpfactionhistory_id) REFERENCES uploader_corpfactionhistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: corpreport_divisionconfig_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY corpreport_divisionconfig
    ADD CONSTRAINT corpreport_divisionconfig_account_id_fkey FOREIGN KEY (division_id) REFERENCES ccpeve_division(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: emauth_authtoken_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY emauth_authtoken
    ADD CONSTRAINT emauth_authtoken_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: emauth_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY emauth_profile
    ADD CONSTRAINT emauth_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: faction_id_refs_id_9b6a5907; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_entity
    ADD CONSTRAINT faction_id_refs_id_9b6a5907 FOREIGN KEY (faction_id) REFERENCES intel_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gmi_index_latest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gmi_index
    ADD CONSTRAINT gmi_index_latest_id_fkey FOREIGN KEY (latest_id) REFERENCES gmi_indexhistory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gmi_upload_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gmi_upload
    ADD CONSTRAINT gmi_upload_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_comment_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_comment
    ADD CONSTRAINT gts_comment_author_id_fkey FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_comment_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_comment
    ADD CONSTRAINT gts_comment_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES gts_ticket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_ticket_assignedto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_ticket
    ADD CONSTRAINT gts_ticket_assignedto_id_fkey FOREIGN KEY (assignedto_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_ticket_createdby_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_ticket
    ADD CONSTRAINT gts_ticket_createdby_id_fkey FOREIGN KEY (createdby_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_ticket_editedby_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_ticket
    ADD CONSTRAINT gts_ticket_editedby_id_fkey FOREIGN KEY (editedby_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_ticket_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_ticket
    ADD CONSTRAINT gts_ticket_state_id_fkey FOREIGN KEY (state_id) REFERENCES gts_state(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_ticket_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_ticket
    ADD CONSTRAINT gts_ticket_type_id_fkey FOREIGN KEY (type_id) REFERENCES gts_tickettype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gts_tickettype_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_tickettype_users
    ADD CONSTRAINT gts_tickettype_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: industry_stock_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_stock
    ADD CONSTRAINT industry_stock_level_id_fkey FOREIGN KEY (level_id) REFERENCES industry_stocklevel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: industry_stock_price_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_stock
    ADD CONSTRAINT industry_stock_price_id_fkey FOREIGN KEY (price_id) REFERENCES industry_pricelist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: industry_stocklevel_watcher_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_stocklevel_watcher
    ADD CONSTRAINT industry_stocklevel_watcher_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: industry_transactioninfo_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_transactioninfo
    ADD CONSTRAINT industry_transactioninfo_account_id_fkey FOREIGN KEY (account_id) REFERENCES industry_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: industry_transactioninfo_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY industry_transactioninfo
    ADD CONSTRAINT industry_transactioninfo_transaction_id_fkey FOREIGN KEY (transaction_id) REFERENCES industry_transaction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_corporation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_corporation_id_fkey FOREIGN KEY (corporation_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_newalliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_newalliance_id_fkey FOREIGN KEY (newalliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_newcorp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_newcorp_id_fkey FOREIGN KEY (newcorp_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_newfaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_newfaction_id_fkey FOREIGN KEY (newfaction_id) REFERENCES intel_faction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_oldalliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_oldalliance_id_fkey FOREIGN KEY (oldalliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_oldcorp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_oldcorp_id_fkey FOREIGN KEY (oldcorp_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_oldfaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_oldfaction_id_fkey FOREIGN KEY (oldfaction_id) REFERENCES intel_faction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_change_pilot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_change
    ADD CONSTRAINT intel_change_pilot_id_fkey FOREIGN KEY (pilot_id) REFERENCES intel_pilot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_changelog_newalliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_changelog
    ADD CONSTRAINT intel_changelog_newalliance_id_fkey FOREIGN KEY (newalliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_changelog_newcorp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_changelog
    ADD CONSTRAINT intel_changelog_newcorp_id_fkey FOREIGN KEY (newcorp_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_changelog_oldalliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_changelog
    ADD CONSTRAINT intel_changelog_oldalliance_id_fkey FOREIGN KEY (oldalliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_changelog_oldcorp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_changelog
    ADD CONSTRAINT intel_changelog_oldcorp_id_fkey FOREIGN KEY (oldcorp_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_changelog_pilot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_changelog
    ADD CONSTRAINT intel_changelog_pilot_id_fkey FOREIGN KEY (pilot_id) REFERENCES intel_pilot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_corporation_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_corporation
    ADD CONSTRAINT intel_corporation_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_corporation_faction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_corporation
    ADD CONSTRAINT intel_corporation_faction_id_fkey FOREIGN KEY (faction_id) REFERENCES intel_faction(id);


--
-- Name: intel_kill_involvedalliances_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedalliances
    ADD CONSTRAINT intel_kill_involvedalliances_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_kill_involvedcorps_corporation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedcorps
    ADD CONSTRAINT intel_kill_involvedcorps_corporation_id_fkey FOREIGN KEY (corporation_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_kill_involvedfactions_faction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedfactions
    ADD CONSTRAINT intel_kill_involvedfactions_faction_id_fkey FOREIGN KEY (faction_id) REFERENCES intel_faction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_kill_involvedpilots_pilot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedpilots
    ADD CONSTRAINT intel_kill_involvedpilots_pilot_id_fkey FOREIGN KEY (pilot_id) REFERENCES intel_pilot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_pilot_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_pilot
    ADD CONSTRAINT intel_pilot_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_pilot_corporation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_pilot
    ADD CONSTRAINT intel_pilot_corporation_id_fkey FOREIGN KEY (corporation_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_trace_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trace
    ADD CONSTRAINT intel_trace_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_trace_corporation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trace
    ADD CONSTRAINT intel_trace_corporation_id_fkey FOREIGN KEY (corporation_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_trace_pilot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trace
    ADD CONSTRAINT intel_trace_pilot_id_fkey FOREIGN KEY (pilot_id) REFERENCES intel_pilot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_trace_submitter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trace
    ADD CONSTRAINT intel_trace_submitter_id_fkey FOREIGN KEY (submitter_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_trackedentity_alliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trackedentity
    ADD CONSTRAINT intel_trackedentity_alliance_id_fkey FOREIGN KEY (alliance_id) REFERENCES intel_alliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: intel_trackedentity_corporation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_trackedentity
    ADD CONSTRAINT intel_trackedentity_corporation_id_fkey FOREIGN KEY (corporation_id) REFERENCES intel_corporation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kill_id_refs_id_286f8ee3; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedpilots
    ADD CONSTRAINT kill_id_refs_id_286f8ee3 FOREIGN KEY (kill_id) REFERENCES intel_kill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kill_id_refs_id_71567286; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedcorps
    ADD CONSTRAINT kill_id_refs_id_71567286 FOREIGN KEY (kill_id) REFERENCES intel_kill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kill_id_refs_id_79845b35; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedfactions
    ADD CONSTRAINT kill_id_refs_id_79845b35 FOREIGN KEY (kill_id) REFERENCES intel_kill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kill_id_refs_id_b1deeb1; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_kill_involvedalliances
    ADD CONSTRAINT kill_id_refs_id_b1deeb1 FOREIGN KEY (kill_id) REFERENCES intel_kill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: parent_id_refs_id_9b6a5907; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY intel_entity
    ADD CONSTRAINT parent_id_refs_id_9b6a5907 FOREIGN KEY (parent_id) REFERENCES intel_entity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recruitment_character_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_character
    ADD CONSTRAINT recruitment_character_user_id_fkey FOREIGN KEY (user_id) REFERENCES recruitment_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recruitment_implant_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_implant
    ADD CONSTRAINT recruitment_implant_character_id_fkey FOREIGN KEY (character_id) REFERENCES recruitment_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recruitment_skill_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_skill
    ADD CONSTRAINT recruitment_skill_character_id_fkey FOREIGN KEY (character_id) REFERENCES recruitment_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: recruitment_standing_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY recruitment_standing
    ADD CONSTRAINT recruitment_standing_character_id_fkey FOREIGN KEY (character_id) REFERENCES recruitment_character(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_message_handler_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY shop_message
    ADD CONSTRAINT shop_message_handler_id_fkey FOREIGN KEY (handler_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order_handler_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY shop_order
    ADD CONSTRAINT shop_order_handler_id_fkey FOREIGN KEY (handler_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order_office_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY shop_order
    ADD CONSTRAINT shop_order_office_id_fkey FOREIGN KEY (office_id) REFERENCES shop_salesoffice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_orderhandler_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY shop_orderhandler
    ADD CONSTRAINT shop_orderhandler_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tickettype_id_refs_id_c143a882; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY gts_tickettype_users
    ADD CONSTRAINT tickettype_id_refs_id_c143a882 FOREIGN KEY (tickettype_id) REFERENCES gts_tickettype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: timezones_tzconfig_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY timezones_tzconfig
    ADD CONSTRAINT timezones_tzconfig_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uploader_authtoken_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_authtoken
    ADD CONSTRAINT uploader_authtoken_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uploader_corpfaction_submitter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_corpfaction
    ADD CONSTRAINT uploader_corpfaction_submitter_id_fkey FOREIGN KEY (submitter_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uploader_corpfactionhistory_uploads_upload_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_corpfactionhistory_uploads
    ADD CONSTRAINT uploader_corpfactionhistory_uploads_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES uploader_upload(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uploader_facwarsystem_upload_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_facwarsystem
    ADD CONSTRAINT uploader_facwarsystem_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES uploader_upload(id);


--
-- Name: uploader_facwarsystemhistory_upload_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_facwarsystemhistory
    ADD CONSTRAINT uploader_facwarsystemhistory_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES uploader_upload(id);


--
-- Name: uploader_markethistory_upload_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_markethistory
    ADD CONSTRAINT uploader_markethistory_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES uploader_upload(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uploader_marketorder_upload_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_marketorder
    ADD CONSTRAINT uploader_marketorder_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES uploader_upload(id);


--
-- Name: uploader_upload_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: emtools
--

ALTER TABLE ONLY uploader_upload
    ADD CONSTRAINT uploader_upload_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

