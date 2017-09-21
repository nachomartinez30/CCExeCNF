CREATE TABLE UPM_UPM (
    UPMID                      INTEGER       NOT NULL
                                             PRIMARY KEY,
    FechaInicio                DATE,
    FechaFin                   DATE,
    TipoUPMID                  INT,
    Altitud                    REAL,
    PendienteRepresentativa    INT,
    FisiografiaID              INT,
    ExposicionID               INT,
    Predio                     TEXT,
    Paraje                     TEXT,
    TipoTenenciaID             INT,
    Accesible                  BOOLEAN,
    GradosLatitud              INT,
    MinutosLatitud             INT,
    SegundosLatitud            REAL,
    GradosLongitud             INT,
    MinutosLongitud            INT,
    SegundosLongitud           REAL,
    Datum                      TEXT,
    ErrorPresicion             INT,
    Azimut                     INT,
    Distancia                  REAL,
    TipoInaccesibilidadID      INT,
    OtroTipoInaccesibilidad    TEXT,
    ExplicacionInaccesibilidad TEXT,
    InformacionContacto        INT,
    Modulo                     CHAR (1),
    CONSTRAINT key_column UNIQUE (
        UPMID
    )
);


CREATE TABLE UPM_MallaPuntos (
    UPMID          INT           PRIMARY KEY
                                 NOT NULL,
    ConglomeradoID INT,
    LatDms         TEXT,
    LongDms        TEXT,
    X              REAL,
    Y              REAL,
    Estado         TEXT,
    Region         TEXT,
    PROYECTO       TEXT,
    A              BOOLEAN,
    B              BOOLEAN,
    C              BOOLEAN,
    D              BOOLEAN,
    E              BOOLEAN,
    F              BOOLEAN,
    G              BOOLEAN,
    H              BOOLEAN,
    SecuenciaID    INT,
    Ciclo          INTEGER,
    ProveedorID    INT,
    Municipio      TEXT,
    MunicipioID    TEXT
);

CREATE TABLE SITIOS_Sitio (
    SitioID                    SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/,
    UPMID                      INTEGER       REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    Sitio                      INT,
    SenialGPS                  BOOLEAN,
    GradosLatitud              INT,
    MinutosLatitud             INT,
    SegundosLatitud            REAL,
    GradosLongitud             INT,
    MinutosLongitud            INT,
    SegundosLongitud           REAL,
    ErrorPresicion             INT,
    EvidenciaMuestreo          BOOLEAN,
    Datum                      TEXT,
    Azimut                     INT,
    Distancia                  REAL,
    SitioAccesible             BOOLEAN,
    TipoInaccesibilidad        INTEGER,
    ExplicacionInaccesibilidad TEXT,
    CoberturaForestal          BOOLEAN,
    Condicion                  BOOLEAN,
    ClaveSerieV                INT,
    FaseSucecional             INT,
    ArbolFuera                 BOOLEAN,
    Ecotono                    INT,
    CondicionPresenteCampo     TEXT,
    CondicionEcotono           TEXT,
    RepobladoFuera             BOOLEAN,
    PorcentajeRepoblado        INT,
    SotobosqueFuera            BOOLEAN,
    PorcentajeSotobosqueFuera  INT,
    Observaciones              TEXT,
    HipsometroBrujula          INT,
    CintaClinometroBrujula     INT,
    Cuadrante1                 INT,
    Cuadrante2                 INT,
    Cuadrante3                 INT,
    Cuadrante4                 INT,
    Distancia1                 REAL,
    Distancia2                 REAL,
    Distancia3                 REAL,
    Distancia4                 REAL,
    Modulo                     CHAR (1) 
);

CREATE TABLE SUELO_Suelo (
    SueloID                       SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                                NOT NULL,
    SitioID                       INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    UsoSueloID                    INT,
    OtroUsoSuelo                  TEXT,
    Espesor                       REAL,
    PendienteDominante            INT,
    Observaciones                 TEXT,
    NumeroCanalillos              INT,
    ProfundidadPromedioCanalillos DECIMAL,
    AnchoPromedioCanalillos       DECIMAL,
    LongitudCanalillos            DECIMAL,
    VolumenCanalillos             DECIMAL,
    NumeroCarcavas                INT,
    ProfundidadPromedioCarcavas   DECIMAL,
    AnchoPromedioCarcavas         DECIMAL,
    LongitudCarcavas              DECIMAL,
    VolumenCarcavas               DECIMAL,
    NumeroMonticulos              INT,
    AlturaPromedioMonticulos      DECIMAL,
    AnchoPromedioMonticulos       DECIMAL,
    LongitudPromedioMonticulos    DECIMAL,
    VolumenMonticulos             DECIMAL,
    Modulo                        CHAR (1) 
);

CREATE TABLE TAXONOMIA_Arbolado (
    ArboladoID             SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/,
    SitioID                INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo            INTEGER,
    NoIndividuo            INT,
    NoRama                 INT,
    Azimut                 INT,
    Distancia              REAL,
    FamiliaID              INT,
    GeneroID               INT,
    EspecieID              INT,
    InfraespecieID         INT,
    NombreComun            TEXT,
    EsColecta              BOOLEAN,
    EsSubmuestra           BOOLEAN,
    FormaVidaID            INT,
    FormaFusteID           INT,
    CondicionID            INT,
    MuertoPieID            INT,
    GradoPutrefaccionID    INT,
    TipoToconID            INT,
    DiametroNormal         REAL,
    DiametroBasal          DECIMAL,
    AlturaTotal            REAL,
    AnguloInclinacion      INTEGER,
    AlturaFusteLimpio      REAL,
    AlturaComercial        REAL,
    DiametroCopaNS         REAL,
    DiametroCopaEO         REAL,
    ProporcionCopaVivaID   INT,
    ExposicionCopaID       INT,
    PosicionCopaID         INT,
    DensidadCopaID         INT,
    MuerteRegresivaID      INT,
    TransparenciaFollajeID INT,
    VigorID                INT,
    NivelVigorID           INT,
    Modulo                 CHAR (1),
    ClaveColecta           TEXT
);

CREATE TABLE TAXONOMIA_RepobladoVM (
    RepobladoVMID            SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                           NOT NULL,
    SitioID                  INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo              INT,
    FormaVidaID              INT,
    FamiliaID                INT,
    GeneroID                 INT,
    EspecieID                INT,
    InfraespecieID           INT,
    NombreComun              TEXT,
    EsColecta                INT,
    Frecuencia50             INT,
    PorcentajeCobertura50    INT,
    Frecuencia51200          INT,
    PorcentajeCobertura51200 INT,
    Frecuencia200            INT,
    PorcentajeCobertura200   INT,
    VigorID                  INT,
    Modulo                   CHAR (1),
    ClaveColecta             TEXT
);


-- Table: ARBOLADO_DanioSeveridad
CREATE TABLE ARBOLADO_DanioSeveridad (
    DanioSeveridadID SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/
                             NOT NULL,
    ArboladoID       INTEGER REFERENCES TAXONOMIA_Arbolado (ArboladoID) ON DELETE CASCADE,
    NumeroDanio      INT,
    AgenteDanioID    INT,
    SeveridadID      INT
);


-- Table: ARBOLADO_Submuestra
CREATE TABLE ARBOLADO_Submuestra (
    SubmuestraID      SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                               NOT NULL,
    SitioID           INT,
    ArboladoID        INTEGER  REFERENCES TAXONOMIA_Arbolado (ArboladoID) ON DELETE CASCADE,
    DiametroBasal     REAL,
    Edad              INT,
    NumeroAnillos25   INT,
    LongitudAnillos10 REAL,
    GrozorCorteza     REAL,
    Modulo            CHAR (1) 
);


-- Table: ARBOLADO_Troza
CREATE TABLE ARBOLADO_Troza (
    TrozaID      SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                          NOT NULL,
    SubmuestraID INTEGER  REFERENCES ARBOLADO_Submuestra (SubmuestraID) ON DELETE CASCADE,
    NoTroza      INT,
    TipoTrozaID  INT,
    Modulo       CHAR (1) 
);


-- Table: BRIGADA_Brigadistas
CREATE TABLE BRIGADA_Brigadistas (
    BrigadistaID    SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/,
    Nombre          TEXT,
    ApellidoPaterno TEXT,
    ApellidoMaterno TEXT,
    PuestoID        INT,
    Activo          INT,
    EmpresaID       INTEGER
);


-- Table: CARBONO_CoberturaDosel
CREATE TABLE CARBONO_CoberturaDosel (
    CoberturaDoselID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                              NOT NULL,
    SitioID          INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Transecto        INT,
    Punto1           BOOLEAN,
    Punto2           BOOLEAN,
    Punto3           BOOLEAN,
    Punto4           BOOLEAN,
    Punto5           BOOLEAN,
    Punto6           BOOLEAN,
    Punto7           BOOLEAN,
    Punto8           BOOLEAN,
    Punto9           BOOLEAN,
    Punto10          BOOLEAN,
    Modulo           CHAR (1) 
);


-- Table: CARBONO_CubiertaVegetal
CREATE TABLE CARBONO_CubiertaVegetal (
    CubiertaVegetalID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                               NOT NULL,
    SitioID           INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Transecto         INT,
    ComponenteID      INT,
    Altura5           REAL,
    Altura10          REAL,
    Modulo            CHAR (1) 
);


-- Table: CARBONO_LongitudComponente
CREATE TABLE CARBONO_LongitudComponente (
    LongitudComponenteID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                       NOT NULL,
    SitioID              INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo          INTEGER,
    Transecto            INT,
    ComponenteID         INT,
    FamiliaID            INT,
    GeneroID             INT,
    EspecieID            INT,
    InfraespecieID       INT,
    NombreComun          TEXT,
    EsColecta            BOOLEAN,
    Segmento1            INTEGER,
    Segmento2            INTEGER,
    Segmento3            INTEGER,
    Segmento4            INTEGER,
    Segmento5            INTEGER,
    Segmento6            INTEGER,
    Segmento7            INTEGER,
    Segmento8            INTEGER,
    Segmento9            INTEGER,
    Segmento10           INTEGER,
    Total                INTEGER,
    Modulo               CHAR (1),
    ClaveColecta         TEXT
);


-- Table: CARBONO_MaterialLenioso100
CREATE TABLE CARBONO_MaterialLenioso100 (
    MaterialLenioso100ID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                  NOT NULL,
    SitioID              INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Transecto            INT,
    Pendiente            INT,
    UnaHora              INT,
    DiezHoras            INT,
    CienHoras            INT,
    Modulo               CHAR (1) 
);


-- Table: CARBONO_MaterialLenioso1000
CREATE TABLE CARBONO_MaterialLenioso1000 (
    MaterialLenioso1000ID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                   NOT NULL,
    SitioID               INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Transecto             INT,
    Diametro              REAL,
    Grado                 INT,
    Modulo                CHAR (1) 
);

CREATE TABLE CAT_ViaAccesibilidad (
    ViaAccesibilidadID INT           NOT NULL
                                     PRIMARY KEY,
    Via                TEXT,
    Descripcion        TEXT
);

-- Table: CAT_AgenteDanio
CREATE TABLE CAT_AgenteDanio (
    AgenteDanioID INT           PRIMARY KEY
                                NOT NULL,
    Clave         CHAR (5),
    Agente        TEXT,
    Descripcion   TEXT
);


-- Table: CAT_CarbonoComponente
CREATE TABLE CAT_CarbonoComponente (
    ComponenteID INT          PRIMARY KEY,
    Componente   TEXT
);


-- Table: CAT_ClaseEspecie
CREATE TABLE CAT_ClaseEspecie (
    ClaseID INT           PRIMARY KEY
                          NOT NULL,
    Nombre  TEXT
);


-- Table: CAT_ClaveSerieV
CREATE TABLE CAT_ClaveSerieV (
    ClaveSerieVID  INT          NOT NULL
                                PRIMARY KEY,
    Ecosistema     TEXT,
    Formacion      TEXT,
    TipoVegetacion TEXT,
    Clave          TEXT,
    EsForestal     BOOL         NOT NULL
);


-- Table: CAT_CondicionAccesibilidad
CREATE TABLE CAT_CondicionAccesibilidad (
    CondicionAccesibilidadID INT           PRIMARY KEY
                                           NOT NULL,
    Condicion                TEXT,
    Descripcion              TEXT
);


-- Table: CAT_CondicionArbolado
CREATE TABLE CAT_CondicionArbolado (
    CondicionID INT           PRIMARY KEY
                              NOT NULL,
    Clave       CHAR (2),
    Descripcion TEXT
);


-- Table: CAT_CondicionMuertoPie
CREATE TABLE CAT_CondicionMuertoPie (
    MuertoPieID INT           PRIMARY KEY ,
    Clave       CHAR (1),
    Descripcion TEXT
);


-- Table: CAT_CondicionVM
CREATE TABLE CAT_CondicionVM (
    CondicionVMID INTEGER      PRIMARY KEY,
    Descripcion   TEXT
);


-- Table: CAT_DensidadColonia
CREATE TABLE CAT_DensidadColonia (
    DensidadColoniaID INTEGER       PRIMARY KEY,
    Descripcion       TEXT
);


-- Table: CAT_DensidadFollaje
CREATE TABLE CAT_DensidadFollaje (
    DensidadFollajeID INTEGER       PRIMARY KEY,
    Descripcion       TEXT
);


-- Table: CAT_Especie
CREATE TABLE CAT_Especie (
    EspecieID INT           PRIMARY KEY
                            NOT NULL,
    Nombre    TEXT,
    GeneroID  INT
);


-- Table: CAT_Estado
CREATE TABLE CAT_Estado (
    EstadoID    INT           PRIMARY KEY
                              NOT NULL,
    Descripcion TEXT,
    RegionID    INT
);


-- Table: CAT_ExposicionLuzCopa
CREATE TABLE CAT_ExposicionLuzCopa (
    ExposicionLuzID INT           PRIMARY KEY
                                  NOT NULL,
    Codigo          CHAR (1),
    Descripcion     TEXT
);


-- Table: CAT_FamiliaEspecie
CREATE TABLE CAT_FamiliaEspecie (
    FamiliaID INT           NOT NULL
                            PRIMARY KEY,
    Nombre    TEXT,
    ClaseID   INT
);


-- Table: CAT_FaseSucecional
CREATE TABLE CAT_FaseSucecional (
    FaseSucecionalID INT          PRIMARY KEY
                                  NOT NULL,
    Descripcion      TEXT,
    Clave            TEXT
);


-- Table: CAT_Genero
CREATE TABLE CAT_Genero (
    GeneroID  INT           PRIMARY KEY
                            NOT NULL,
    Nombre    TEXT,
    FamiliaID INT
);


-- Table: CAT_GradoPutrefaccionArbolado
CREATE TABLE CAT_GradoPutrefaccionArbolado (
    GradoPutrefaccionID INT           PRIMARY KEY,
    Clave               CHAR (1),
    Tipo                TEXT,
    Descripcion         TEXT
);


-- Table: CAT_Infraespecie
CREATE TABLE CAT_Infraespecie (
    InfraespecieID INTEGER       PRIMARY KEY ,
    Nombre         TEXT,
    EspecieID      INTEGER
);


-- Table: CAT_MedioTransporte
CREATE TABLE CAT_MedioTransporte (
    MedioTransporteID SMALLINT       PRIMARY KEY
                                     NOT NULL,
    Medio             TEXT,
    Descripcion       TEXT
);


-- Table: CAT_Morfotipos
CREATE TABLE CAT_Morfotipos (
    MorfotiposID INT           PRIMARY KEY
                               NOT NULL,
    Descripcion  TEXT
);


-- Table: CAT_Municipio
CREATE TABLE CAT_Municipio (
    MunicipioID INT           PRIMARY KEY
                              NOT NULL,
    Clave       TEXT,
    Descripcion TEXT,
    EstadoID    INT
);


-- Table: CAT_NivelVigor
CREATE TABLE CAT_NivelVigor (
    NivelVigorID INT          PRIMARY KEY
                              NOT NULL,
    Clave        TEXT,
    Descripcion  TEXT
);


-- Table: CAT_PorcentajeArbolado
CREATE TABLE CAT_PorcentajeArbolado (
    PorcentajeArboladoID INT          PRIMARY KEY
                                      NOT NULL,
    Clave                CHAR (3),
    Descripcion          TEXT
);


-- Table: CAT_PosicionCopa
CREATE TABLE CAT_PosicionCopa (
    PosicionCopaID INT           PRIMARY KEY
                                 NOT NULL,
    PosicionCopa   TEXT,
    Descripcion    TEXT
);


-- Table: CAT_PresenciaEpifita
CREATE TABLE CAT_PresenciaEpifita (
    PresenciaEpifitaID INT           PRIMARY KEY,
    Descripcion        TEXT
);


-- Table: CAT_ProfundidadMuestras
CREATE TABLE CAT_ProfundidadMuestras (
    ProfundidadMuestraID INTEGER      PRIMARY KEY,
    Descripcion          TEXT
);


-- Table: CAT_ProfundidadMuestreo
CREATE TABLE CAT_ProfundidadMuestreo (
    ProfundidadMuestreoID INT          PRIMARY KEY,
    Descripcion           TEXT
);


-- Table: CAT_Region
CREATE TABLE CAT_Region (
    RegionID    INT           PRIMARY KEY
                              NOT NULL,
    Descripcion TEXT,
    Anio        TEXT
);


-- Table: CAT_SeccionesTaxonomicas
CREATE TABLE CAT_SeccionesTaxonomicas (
    SeccionTaxonomicaID INTEGER       PRIMARY KEY,
    Seccion             TEXT
);


-- Table: CAT_SeveridadZA
CREATE TABLE CAT_SeveridadZA (
    SeveridadID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/,
    Descripcion TEXT
);


-- Table: CAT_TipoColocacion
CREATE TABLE CAT_TipoColocacion (
    TipoColocacionID INT           PRIMARY KEY,
    Descripcion      TEXT
);


-- Table: CAT_TipoComponente
CREATE TABLE CAT_TipoComponente (
    ComponenteID INT          PRIMARY KEY
                              NOT NULL,
    Componente   TEXT
);


-- Table: CAT_TipoEpifita
CREATE TABLE CAT_TipoEpifita (
    TipoEpifitaID INT          PRIMARY KEY,
    Nombre        TEXT
);


-- Table: CAT_TipoEspesorSuelo
CREATE TABLE CAT_TipoEspesorSuelo (
    ProfundidadSueloID INT          PRIMARY KEY
                                    NOT NULL,
    Espesor            TEXT,
    Categoria          TEXT
);


-- Table: CAT_TipoExposicion
CREATE TABLE CAT_TipoExposicion (
    ExposicionID INT          PRIMARY KEY
                              NOT NULL,
    Clave        CHAR (2),
    Descripcion  TEXT
);


-- Table: CAT_TipoFisiografia
CREATE TABLE CAT_TipoFisiografia (
    FisiografiaID   INT           PRIMARY KEY
                                  NOT NULL,
    TipoFisiografia TEXT,
    Descripcion     TEXT
);


-- Table: CAT_TipoFormaCrecimiento
CREATE TABLE CAT_TipoFormaCrecimiento (
    FormaCrecimientoID INTEGER      PRIMARY KEY,
    Descripcion        TEXT
);


-- Table: CAT_TipoFormaFuste
CREATE TABLE CAT_TipoFormaFuste (
    FormaFusteID INT          PRIMARY KEY
                              NOT NULL,
    Descripcion  TEXT
);


-- Table: CAT_TipoFormaGeometrica
CREATE TABLE CAT_TipoFormaGeometrica (
    FormaGeometricaID INTEGER       PRIMARY KEY,
    Descripcion       TEXT
);


-- Table: CAT_TipoFormaVidaArbolado
CREATE TABLE CAT_TipoFormaVidaArbolado (
    FormaVidaID INT           PRIMARY KEY
                              NOT NULL,
    Descripcion TEXT
);


-- Table: CAT_TipoFormaVidaRepobladoVM
CREATE TABLE CAT_TipoFormaVidaRepobladoVM (
    FormaVidaRepobladoVMID INT           PRIMARY KEY
                                         NOT NULL,
    Descripcion            TEXT
);


-- Table: CAT_TipoFormaVidaZA
CREATE TABLE CAT_TipoFormaVidaZA (
    FormaVidaZAID INTEGER       PRIMARY KEY,
    Morfotipo     TEXT
);


-- Table: CAT_TipoHojarasca
CREATE TABLE CAT_TipoHojarasca (
    TipoHojarascaID INT           PRIMARY KEY
                                  NOT NULL,
    Clave           TEXT,
    Descripcion     TEXT
);


-- Table: CAT_TipoInaccesibilidad
CREATE TABLE CAT_TipoInaccesibilidad (
    TipoInaccesibilidadID INT           PRIMARY KEY
                                        NOT NULL,
    Clave                 TEXT,
    Tipo                  TEXT,
    Descripcion           TEXT
);


-- Table: CAT_TipoLecturaTierra
CREATE TABLE CAT_TipoLecturaTierra (
    LecturaTierraID INT          PRIMARY KEY
                                 NOT NULL,
    Clave           CHAR (1),
    Descripcion     TEXT
);


-- Table: CAT_TipoTenencia
CREATE TABLE CAT_TipoTenencia (
    TipoTenenciaID INT          PRIMARY KEY
                                NOT NULL,
    Descripcion    TEXT
);


-- Table: CAT_TipoTocon
CREATE TABLE CAT_TipoTocon (
    TipoToconID INT           PRIMARY KEY
                              NOT NULL,
    Clave       CHAR (1),
    Descripcion TEXT
);


-- Table: CAT_TipoTroza
CREATE TABLE CAT_TipoTroza (
    TipoTrozaID INT           NOT NULL,
    Clave       CHAR (2),
    Descripcion TEXT
);


-- Table: CAT_TipoUPM
CREATE TABLE CAT_TipoUPM (
    TipoUPMID   INT           PRIMARY KEY
                              NOT NULL,
    TipoUPM     TEXT,
    Descripcion TEXT
);


-- Table: CAT_TipoVigorArbolado
CREATE TABLE CAT_TipoVigorArbolado (
    VigorID     INT           PRIMARY KEY
                              NOT NULL,
    Descripcion TEXT
);


-- Table: CAT_TipoVigorSotobosqueRepoblado
CREATE TABLE CAT_TipoVigorSotobosqueRepoblado (
    VigorID     INTEGER       PRIMARY KEY,
    Descripcion TEXT
);


-- Table: CAT_TransporteAccesibilidad
CREATE TABLE CAT_TransporteAccesibilidad (
    ID                 INT PRIMARY KEY,
    MedioTransporteID  INT REFERENCES CAT_MedioTransporte (MedioTransporteID),
    ViaAccesibilidadID INT REFERENCES CAT_ViaAccesibilidad (ViaAccesibilidadID) 
);


-- Table: CAT_UsoSuelo
CREATE TABLE CAT_UsoSuelo (
    UsoSueloID  INT           PRIMARY KEY
                              NOT NULL,
    Descripcion TEXT
);


-- Table: CAT_ViaAccesibilidad



-- Table: PC_Accesibilidad
CREATE TABLE PC_Accesibilidad (
    AccesibilidadID          SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                      NOT NULL,
    UPMID                    INTEGER  REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    MedioTransporteID        INT,
    ViaAccesibilidadID       INT,
    Distancia                REAL,
    CondicionAccesibilidadID INT,
    Modulo                   CHAR (1) 
);


-- Table: PC_PuntoControl
CREATE TABLE PC_PuntoControl (
    PuntoControlID   SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                   NOT NULL,
    UPMID            INT           NOT NULL
                                   REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    Descripcion      TEXT,
    Paraje           TEXT,
    GradosLatitud    INT,
    MinutosLatitud   INT,
    SegundosLatitud  REAL,
    GradosLongitud   INT,
    MinutosLongitud  INT,
    SegundosLongitud REAL,
    ErrorPresicion   INT,
    Datum            TEXT,
    Azimut           INT,
    Distancia        REAL,
    Modulo           CHAR (1) 
);


-- Table: REPOBLADO_AgenteDanio
CREATE TABLE REPOBLADO_AgenteDanio (
    RepobladoDanioID SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/,
    RepobladoVMID    INTEGER REFERENCES TAXONOMIA_RepobladoVM (RepobladoVMID) ON DELETE CASCADE,
    NumeroDanio      INT,
    AgenteDanioID    INT,
    SeveridadID      INT
);


-- Table: SEG_EstatusCaptura
CREATE TABLE SEG_EstatusCaptura (
    UPMID              INT,
    FechaInicioCaptura DATE,
    FechaFinCaptura    DATE,
    UsuarioID          INT
);


-- Table: SITIOS_CoberturaSuelo
CREATE TABLE SITIOS_CoberturaSuelo (
    CoberturaID  SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                          NOT NULL,
    SitioID      INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Gramineas    INT,
    Helechos     INT,
    Musgos       INT,
    Liquenes     INT,
    Hierbas      INT,
    Roca         INT,
    SueloDesnudo INT,
    Hojarasca    INT,
    Grava        INT,
    Otros        INT,
    Modulo       CHAR (1) 
);


-- Table: SITIOS_FotografiaHemisferica
CREATE TABLE SITIOS_FotografiaHemisferica (
    FotografiaHemisfericaID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                     NOT NULL,
    SitioID                 INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    CoberturaArborea        BOOLEAN,
    TomaFotografia          BOOLEAN,
    Hora                    varchar(5),
    DeclinacionMagnetica    INT,
    Modulo                  CHAR (1) 
);


-- Table: SITIOS_Observaciones
CREATE TABLE SITIOS_Observaciones (
    ObservacionesID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                  NOT NULL,
    SitioID         INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    FormatoID       INT,
    Observaciones   TEXT
);


-- Table: SITIOS_ParametrosFisicoQuimicos
CREATE TABLE SITIOS_ParametrosFisicoQuimicos (
    ParametrosFQID         SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                         NOT NULL,
    SitioID                INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    TipoAgua               BOOLEAN,
    Salinidad              REAL,
    Temperatura            REAL,
    ConductividadElectrica REAL,
    Ph                     REAL,
    PotencialRedox         REAL,
    Profundidad            REAL,
    Observaciones          TEXT,
    Modulo                 CHAR (1) 
);


-- Table: SITIOS_Sitio



-- Table: SITIOS_Transponder
CREATE TABLE SITIOS_Transponder (
    TransponderID    SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                   NOT NULL,
    SitioID          INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    TipoColocacionID INT,
    Especifique      TEXT,
    Observaciones    TEXT,
    Modulo           CHAR (1) 
);


-- Table: SUBMUESTRA_Observaciones
CREATE TABLE SUBMUESTRA_Observaciones (
    SubmuestraObservacionesID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/,
    SitioID                   INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Observaciones             TEXT
);


-- Table: SUELO_Canalillo
CREATE TABLE SUELO_Canalillo (
    CanalilloID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                         NOT NULL,
    SitioID     INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Numero      INT,
    Ancho       REAL,
    Profundidad REAL,
    Modulo      CHAR (1) 
);


-- Table: SUELO_Carcava
CREATE TABLE SUELO_Carcava (
    CarcavaID   SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                         NOT NULL,
    SitioID     INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Numero      INT,
    Ancho       REAL,
    Profundidad REAL,
    Modulo      CHAR (1) 
);


-- Table: SUELO_CoberturaSuelo
CREATE TABLE SUELO_CoberturaSuelo (
    CoberturaSueloID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                              NOT NULL,
    SitioID          INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Transecto        INT,
    Pendiente        DECIMAL,
    Modulo           CHAR (1) 
);


-- Table: SUELO_Costras
CREATE TABLE SUELO_Costras (
    CostrasID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                       NOT NULL,
    SitioID   INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Numero    INT,
    Diametro  REAL,
    Modulo    CHAR (1) 
);


-- Table: SUELO_DeformacionViento
CREATE TABLE SUELO_DeformacionViento (
    DeformacionVientoID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                 NOT NULL,
    SitioID             INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Medicion            INT,
    Altura              REAL,
    Diametro            REAL,
    Longitud            REAL,
    Distancia           REAL,
    Azimut              INT,
    Modulo              CHAR (1) 
);


-- Table: SUELO_DensidadAparente
CREATE TABLE SUELO_DensidadAparente (
    DensidadAparenteID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                     NOT NULL,
    SitioID            INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    ProfundidadReal    REAL,
    DiametroCilindro   REAL,
    VolumenMaterial    REAL,
    PesoTotalSuelo     REAL,
    PesoTotalMuestra   REAL,
    Observaciones      TEXT,
    Modulo             CHAR (10) 
);


-- Table: SUELO_ErosionHidricaCanalillo
CREATE TABLE SUELO_ErosionHidricaCanalillo (
    ErosionCanalilloID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                NOT NULL,
    SitioID            INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Medicion           INT,
    Profundidad        REAL,
    Ancho              REAL,
    Distancia          REAL,
    Azimut             INT,
    Modulo             CHAR (1) 
);


-- Table: SUELO_ErosionHidricaCarcava
CREATE TABLE SUELO_ErosionHidricaCarcava (
    ErosionCarcavaID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                              NOT NULL,
    SitioID          INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Medicion         INT,
    Profundidad      REAL,
    Ancho            REAL,
    Distancia        REAL,
    Azimut           INT,
    Modulo           CHAR (1) 
);


-- Table: SUELO_ErosionLaminar
CREATE TABLE SUELO_ErosionLaminar (
    ErosionLaminarID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                              NOT NULL,
    SitioID          INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Numero           INT,
    Ancho            REAL,
    Largo            REAL,
    Modulo           CHAR (1) 
);


-- Table: SUELO_EvidenciaErosion
CREATE TABLE SUELO_EvidenciaErosion (
    EvidenciaErosionID SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/,
    CoberturaSueloID   INTEGER REFERENCES SUELO_CoberturaSuelo (CoberturaSueloID) ON DELETE CASCADE,
    Punto              INT,
    Dosel              INT,
    LecturaTierraID    INT
);


-- Table: SUELO_Hojarasca
CREATE TABLE SUELO_Hojarasca (
    HojarascaID     SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                  NOT NULL,
    SitioID         INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Punto           INT,
    TipoHojarascaID INT,
    EspesorHO       REAL,
    EspesorF        REAL,
    PesoTotalHO     REAL,
    PesoTotalF      REAL,
    PesoMuestraHO   REAL,
    PesoMuestraF    REAL,
    Observaciones   TEXT,
    ClaveHO         TEXT,
    ClaveF          TEXT,
    Modulo          CHAR (1) 
);


-- Table: SUELO_LongitudCanalillo
CREATE TABLE SUELO_LongitudCanalillo (
    LongitudCanalilloID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                 NOT NULL,
    SitioID             INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    CampoLongitud       INT,
    Longitud            REAL,
    Modulo              CHAR (1) 
);


-- Table: SUELO_LongitudCarcava
CREATE TABLE SUELO_LongitudCarcava (
    LongitudCarcavaID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                               NOT NULL,
    SitioID           INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    CampoLongitud     INT,
    Longitud          REAL,
    Modulo            CHAR (1) 
);


-- Table: SUELO_LongitudMonticulo
CREATE TABLE SUELO_LongitudMonticulo (
    LongitudMonticuloID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                 NOT NULL,
    SitioID             INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    CampoLongitud       INT,
    Longitud            REAL,
    Modulo              CHAR (1) 
);


-- Table: SUELO_MedicionCanalillos
CREATE TABLE SUELO_MedicionCanalillos (
    MedicionCanalillosID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                  NOT NULL,
    SitioID              INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    NumeroCanalillos     INT,
    ProfundidadPromedio  REAL,
    Longitud             REAL,
    Volumen              REAL,
    Modulo               CHAR (1) 
);


-- Table: SUELO_MedicionCarcavas
CREATE TABLE SUELO_MedicionCarcavas (
    MedicionCarcavasID  SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                 NOT NULL,
    SitioID             INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    NumeroCarcavas      INT,
    ProfundidadPromedio REAL,
    AnchoPromedio       REAL,
    Longitud            REAL,
    Volumen             REAL,
    Modulo              CHAR (1) 
);


-- Table: SUELO_MedicionDunas
CREATE TABLE SUELO_MedicionDunas (
    MedicionDunas  SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                            NOT NULL,
    SitioID        INTEGER  REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    NumeroDunas    INT,
    AlturaPromedio REAL,
    AnchoPromedio  REAL,
    Longitud       REAL,
    Volumen        REAL,
    Modulo         CHAR (1) 
);


-- Table: SUELO_Muestras
CREATE TABLE SUELO_Muestras (
    MuestrasID    SERIAL /*INTEGER*/      PRIMARY KEY /*auto_increment*/,
    SitioID       INTEGER      REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    ProfundidadID INTEGER,
    PesoMuestra   DECIMAL,
    Muestras      INTEGER,
    Lectura1      DECIMAL,
    Lectura2      DECIMAL,
    Lectura3      DECIMAL,
    Lectura4      DECIMAL,
    Promedio      DECIMAL,
    ClaveColecta  TEXT
);


-- Table: SUELO_MuestrasPerfil
CREATE TABLE SUELO_MuestrasPerfil (
    MuestrasPerfilID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/,
    SitioID          INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    GradosLatitud    INTEGER,
    MinutosLatitud   INTEGER,
    SegundosLatitud  DECIMAL,
    GradosLongitud   INTEGER,
    MinutosLongitud  INTEGER,
    SegundosLongitud DECIMAL,
    Elevacion        DECIMAL,
    DiametroInterno  DECIMAL,
    DiametroExterno  DECIMAL,
    Altura           DECIMAL,
    Observaciones    TEXT
);


-- Table: SUELO_MuestrasPerfil_2015
CREATE TABLE SUELO_MuestrasPerfil_2015 (
    MuestrasPerfilID           SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                             NOT NULL,
    SitioID                    INT           REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    ProfundidadMuestra_0_5_1   REAL,
    ProfundidadMuestra_0_5_2   REAL,
    ProfundidadMuestra_0_5_3   REAL,
    ProfundidadMuestra_5_15_1  REAL,
    ProfundidadMuestra_5_15_2  REAL,
    ProfundidadMuestra_15_30   REAL,
    ProfundidadMuestra_30_60   REAL,
    ProfundidadMuestra_60_100  REAL,
    ProfundidadMuestra_100_200 REAL,
    Observaciones              TEXT,
    Modulo                     CHAR (1) 
);


-- Table: SUELO_PavimentoErosion
CREATE TABLE SUELO_PavimentoErosion (
    PavimentoErosionID SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                                NOT NULL,
    SitioID            INT      REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Numero             INT,
    Diametro           REAL,
    Modulo             CHAR (1) 
);


-- Table: SUELO_Pedestal
CREATE TABLE SUELO_Pedestal (
    PedestalID SERIAL /*INTEGER*/   PRIMARY KEY /*auto_increment*/
                         NOT NULL,
    SitioID    INTEGER   REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Numero     INT,
    Altura     REAL,
    Modulo     CHAR (10) 
);


-- Table: SUELO_Profundidad
CREATE TABLE SUELO_Profundidad (
    ProfundidadSueloID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                     NOT NULL,
    SitioID            INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Punto              INT,
    Profundidad030     REAL,
    Profundidad3060    REAL,
    PesoTotal030       REAL,
    PesoTotal3060      REAL,
    Equipo030          TEXT,
    Equipo3060         TEXT,
    Observaciones      TEXT,
    Clave030           TEXT,
    Clave3060          TEXT,
    Modulo             CHAR (1) 
);


-- Table: SUELO_Suelo


-- Table: SUELO_VarillaErosion
CREATE TABLE SUELO_VarillaErosion (
    VarillaID   SERIAL /*INTEGER*/  PRIMARY KEY /*auto_increment*/
                         NOT NULL,
    SitioID     INT      REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    NoVarilla   INT,
    Azimut      INT,
    Distancia   REAL,
    Profundidad REAL,
    Modulo      CHAR (1) 
);


-- Table: SYS_Formatos
CREATE TABLE SYS_Formatos (
    FormatoID  INTEGER       PRIMARY KEY,
    Formulario TEXT,
    Formato    TEXT,
    Modulo     CHAR (1) 
);


-- Table: SYS_Seccion
CREATE TABLE SYS_Seccion (
    SeccionID  INTEGER       NOT NULL,
    Seccion    TEXT,
    SubSeccion TEXT,
    Formulario TEXT,
    Modulo     CHAR (1),
    Sesion     INT
);


-- Table: SYS_SecuenciaCaptura
CREATE TABLE SYS_SecuenciaCaptura (
    SecuenciaCapturaID SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/,
    SecuenciaID        INTEGER,
    UPMID              INTEGER REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    Sitio              INT,
    FormatoID          INT,
    Estatus            INT     DEFAULT (0) 
);


-- Table: SYS_UPM_Revision
CREATE TABLE SYS_UPM_Revision (
    RevisionID  SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/,
    UPMID       INTEGER REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    SitioID     INT,
    Sitio       INT,
    SecuenciaID INT
);



-- Table: TAXONOMIA_ColectaBotanica
CREATE TABLE TAXONOMIA_ColectaBotanica (
    ColectaBotanicaID SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                    NOT NULL,
    UPMID             INTEGER       REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    FamiliaID         INTEGER,
    GeneroID          INTEGER,
    EspecieID         INTEGER,
    InfraespecieID    INTEGER,
    NombreComun       TEXT,
    Sitio             INTEGER,
    SeccionID         INTEGER,
    Consecutivo       INTEGER,
    ClaveColecta      TEXT,
    ContraFuertes     BOOLEAN,
    Exudado           BOOLEAN,
    IndicarExudado    TEXT,
    Color             BOOLEAN,
    IndicarColor      TEXT,
    CambioColor       BOOLEAN,
    AceitesVolatiles  BOOLEAN,
    ColorFlor         BOOLEAN,
    IndicarColorFlor  TEXT,
    HojasTejidoVivo   BOOLEAN,
    FotoFlor          BOOLEAN,
    FotoFruto         BOOLEAN,
    FotoHojasArriba   BOOLEAN,
    FotoHojasAbajo    BOOLEAN,
    FotoArbolCompleto BOOLEAN,
    FotoCorteza       BOOLEAN,
    VirutaIncluida    BOOLEAN,
    CortezaIncluida   BOOLEAN,
    MaderaIncluida    BOOLEAN,
    Observaciones     TEXT,
    Modulo            CHAR (1) 
);


-- Table: TAXONOMIA_Repoblado
CREATE TABLE TAXONOMIA_Repoblado (
    RepobladoID      SERIAL /*INTEGER*/      PRIMARY KEY /*auto_increment*/
                                  NOT NULL,
    SitioID          INTEGER      REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo      INTEGER,
    FamiliaID        INTEGER,
    GeneroID         INT,
    EspecieID        INT,
    InfraespecieID   INT,
    EsColecta        INT,
    NombreComun      TEXT,
    Frecuencia025150 INT,
    Edad025150       INT,
    Frecuencia151275 INT,
    Edad151275       INT,
    Frecuencia275    INT,
    Edad275          INT,
    VigorID          INT,
    DanioID          INT,
    PorcentajeDanio  INT,
    Modulo           CHAR (1),
    ClaveColecta     TEXT
);


-- Table: TAXONOMIA_RepobladoVM


-- Table: TAXONOMIA_SotoBosque
CREATE TABLE TAXONOMIA_SotoBosque (
    SotoBosqueID     SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                   NOT NULL,
    SitioID          INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo      INTEGER,
    FamiliaID        INTEGER,
    GeneroID         INTEGER,
    EspecieID        INTEGER,
    InfraespecieID   INT,
    NombreComun      TEXT,
    EsColecta        BOOLEAN,
    Frecuencia025150 INT,
    Cobertura025150  INT,
    Frecuencia151275 INT,
    Cobertura151275  INT,
    Frecuencia275    INT,
    Cobertura275     INT,
    VigorID          INT,
    DanioID          INT,
    PorcentajeDanio  INT,
    Modulo           CHAR (1),
    ClaveColecta     TEXT
);


-- Table: TAXONOMIA_VegetacionMayorGregarios
CREATE TABLE TAXONOMIA_VegetacionMayorGregarios (
    VegetacionMayorID      SERIAL /*INTEGER*/      PRIMARY KEY /*auto_increment*/
                                        NOT NULL,
    SitioID                INTEGER      REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo            INT,
    NoIndividuo            INT,
    FormaVidaID            INT,
    CondicionID            INT,
    FamiliaID              INT,
    GeneroID               INT,
    EspecieID              INT,
    InfraespecieID         INT,
    EsColecta              BOOLEAN,
    NombreComun            TEXT,
    FormaCrecimientoID     INT,
    DensidadColoniaID      INT,
    AlturaTotalMaxima      REAL,
    AlturaTotalMedia       REAL,
    AlturaTotalMinima      REAL,
    DiametroCoberturaMayor REAL,
    DiametroCoberturaMenor REAL,
    VigorID                INT,
    Modulo                 CHAR (1),
    ClaveColecta           TEXT
);


-- Table: TAXONOMIA_VegetacionMayorIndividual
CREATE TABLE TAXONOMIA_VegetacionMayorIndividual (
    VegetacionMayorID      SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                         NOT NULL,
    SitioID                INTEGER       REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo            INTEGER,
    NoIndividuo            INT,
    FormaVidaID            INT,
    CondicionID            INT,
    FamiliaID              INT,
    GeneroID               INT,
    EspecieID              INT,
    InfraespecieID         INT,
    EsColecta              BOOLEAN,
    NombreComun            TEXT,
    FormaGeometricaID      INT,
    DensidadFollajeID      INT,
    DiametroBase           REAL,
    AlturaTotal            REAL,
    DiametroCoberturaMayor REAL,
    DiametroCoberturaMenor REAL,
    VigorID                INT,
    Modulo                 CHAR (1),
    ClaveColecta           TEXT
);


-- Table: TAXONOMIA_VegetacionMenor
CREATE TABLE TAXONOMIA_VegetacionMenor (
    VegetacionMenorID   SERIAL /*INTEGER*/      PRIMARY KEY /*auto_increment*/
                                     NOT NULL,
    SitioID             INTEGER      REFERENCES SITIOS_Sitio (SitioID) ON DELETE CASCADE,
    Consecutivo         INT,
    FamiliaID           INT,
    GeneroID            INT,
    EspecieID           INT,
    InfraespecieID      INT,
    NombreComun         TEXT,
    EsColecta           BOOLEAN,
    FormaVidaID         INT,
    CondicionID         INT,
    Numero0110          INT,
    Numero1125          INT,
    Numero2650          INT,
    Numero5175          INT,
    Numero76100         INT,
    Numero101125        INT,
    Numero126150        INT,
    Numero150           INT,
    PorcentajeCobertura INT,
    VigorID             INT,
    Modulo              CHAR (1),
    ClaveColecta        TEXT
);


-- Table: UPM_Brigada
CREATE TABLE UPM_Brigada (
    BrigadaID    SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/
                         NOT NULL,
    UPMID        INT     REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    BrigadistaID INT,
    PuestoID     INT,
    EmpresaID    INTEGER
);


-- Table: UPM_Contacto
CREATE TABLE UPM_Contacto (
    ContactoID      SERIAL /*INTEGER*/       PRIMARY KEY /*auto_increment*/
                                  NOT NULL,
    UPMID           INT           REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    TipoContacto    BOOLEAN,
    Nombre          TEXT,
    Direccion       TEXT,
    TipoTelefono    BOOLEAN,
    NumeroTelefono  TEXT,
    TieneCorreo     BOOLEAN,
    DireccionCorreo TEXT,
    TieneRadio      BOOLEAN,
    Canal           TEXT,
    Frecuencia      TEXT,
    Observaciones   TEXT,
    Modulo          CHAR (1) 
);


-- Table: UPM_Epifita
CREATE TABLE UPM_Epifita (
    EpifitaID          SERIAL /*INTEGER*/     PRIMARY KEY /*auto_increment*/
                                   NOT NULL,
    UPMID              INT         REFERENCES UPM_UPM (UPMID) ON DELETE CASCADE,
    ClaseTipoID        INT,
    PresenciaTroncosID INT,
    PresenciaRamasID   INT,
    Modulo             TEXT
);


-- Table: UPM_MallaPuntos



-- Table: VEGETACIONMAYORG_DanioSeveridad
CREATE TABLE VEGETACIONMAYORG_DanioSeveridad (
    DanioSeveridadID  SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/,
    VegetacionMayorID INTEGER REFERENCES TAXONOMIA_VegetacionMayorGregarios (VegetacionMayorID) ON DELETE CASCADE,
    NumeroDanio       INT,
    AgenteDanioID     INT,
    SeveridadID       INT
);


-- Table: VEGETACIONMAYORI_DanioSeveridad
CREATE TABLE VEGETACIONMAYORI_DanioSeveridad (
    DanioSeveridadID  SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/,
    VegetacionMayorID INTEGER REFERENCES TAXONOMIA_VegetacionMayorIndividual (VegetacionMayorID) ON DELETE CASCADE,
    NumeroDanio       INT,
    AgenteDanioID     INT,
    SeveridadID       INT
);


-- Table: VEGETACIONMENOR_DanioSeveridad
CREATE TABLE VEGETACIONMENOR_DanioSeveridad (
    DanioSeveridadVMID SERIAL /*INTEGER*/ PRIMARY KEY /*auto_increment*/,
    VegetacionMenorID  INTEGER REFERENCES TAXONOMIA_VegetacionMenor (VegetacionMenorID) ON DELETE CASCADE,
    NumeroDanio        INT,
    AgenteDanioID      INT,
    SeveridadID        INT
);


/*-- Trigger: Borrar_AccesibilidadUPM
CREATE TRIGGER Borrar_AccesibilidadUPM
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM PC_Accesibilidad
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_Brigada
CREATE TRIGGER Borrar_Brigada
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM UPM_Brigada
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_CarbonoCoberturaDosel
CREATE TRIGGER Borrar_CarbonoCoberturaDosel
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM CARBONO_CoberturaDosel
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_CarbonoCubiertaVegetal
CREATE TRIGGER Borrar_CarbonoCubiertaVegetal
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM CARBONO_CubiertaVegetal
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_CarbonoLongitudComponentes
CREATE TRIGGER Borrar_CarbonoLongitudComponentes
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM CARBONO_LongitudComponente
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_CarbonoMaterialLenioso100
CREATE TRIGGER Borrar_CarbonoMaterialLenioso100
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM CARBONO_MaterialLenioso100
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_CarbonoMaterialLenioso1000
CREATE TRIGGER Borrar_CarbonoMaterialLenioso1000
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM CARBONO_MaterialLenioso1000
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_ColectaBotanica
CREATE TRIGGER Borrar_ColectaBotanica
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_ColectaBotanica
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_Contacto
CREATE TRIGGER Borrar_Contacto
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM UPM_Contacto
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_DanioSeveridadArbolado
CREATE TRIGGER Borrar_DanioSeveridadArbolado
        BEFORE DELETE
            ON TAXONOMIA_Arbolado
      FOR EACH ROW
BEGIN
    DELETE FROM ARBOLADO_DanioSeveridad
          WHERE ArboladoID = OLD.ArboladoID;
END;


-- Trigger: Borrar_DanioSeveridadVM
CREATE TRIGGER Borrar_DanioSeveridadVM
        BEFORE DELETE
            ON TAXONOMIA_VegetacionMenor
      FOR EACH ROW
BEGIN
    DELETE FROM VEGETACIONMENOR_DanioSeveridad
          WHERE VegetacionMenorID = OLD.VegetacionMenorID;
END;


-- Trigger: Borrar_DanioSeveridadVMG
CREATE TRIGGER Borrar_DanioSeveridadVMG
        BEFORE DELETE
            ON TAXONOMIA_VegetacionMayorGregarios
      FOR EACH ROW
BEGIN
    DELETE FROM VEGETACIONMAYORG_DanioSeveridad
          WHERE VegetacionMayorID = OLD.VegetacionMayorID;
END;


-- Trigger: Borrar_DanioSeveridadVMI
CREATE TRIGGER Borrar_DanioSeveridadVMI
        BEFORE DELETE
            ON TAXONOMIA_VegetacionMayorIndividual
      FOR EACH ROW
BEGIN
    DELETE FROM VEGETACIONMAYORI_DanioSeveridad
          WHERE VegetacionMayorID = OLD.VegetacionMayorID;
END;


-- Trigger: Borrar_Epifitas
CREATE TRIGGER Borrar_Epifitas
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM UPM_Epifita
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_Evidencia_Erosion
CREATE TRIGGER Borrar_Evidencia_Erosion
        BEFORE DELETE
            ON SUELO_CoberturaSuelo
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_EvidenciaErosion
          WHERE CoberturaSueloID = OLD.CoberturaSueloID;
END;


-- Trigger: Borrar_MuestrasPerfil2015
CREATE TRIGGER Borrar_MuestrasPerfil2015
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_MuestrasPerfil_2015
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_PuntoControl
CREATE TRIGGER Borrar_PuntoControl
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM PC_PuntoControl
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_RepobladoVMAgenteDanio
CREATE TRIGGER Borrar_RepobladoVMAgenteDanio
        BEFORE DELETE
            ON TAXONOMIA_RepobladoVM
      FOR EACH ROW
BEGIN
    DELETE FROM REPOBLADO_AgenteDanio
          WHERE RepobladoVMID = OLD.RepobladoVMID;
END;


-- Trigger: Borrar_SecuenciaCaptura
CREATE TRIGGER Borrar_SecuenciaCaptura
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM SYS_SecuenciaCaptura
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_Sitios
CREATE TRIGGER Borrar_Sitios
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM SITIOS_Sitio
          WHERE UPMID = OLD.UPMID;
END;


-- Trigger: Borrar_SitiosCoberturaSuelo
CREATE TRIGGER Borrar_SitiosCoberturaSuelo
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SITIOS_CoberturaSuelo
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SitiosFotoHemisferica
CREATE TRIGGER Borrar_SitiosFotoHemisferica
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SITIOS_FotografiaHemisferica
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SitiosObservaciones
CREATE TRIGGER Borrar_SitiosObservaciones
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SITIOS_Observaciones
          WHERE SitioID = old.SitioID;
END;


-- Trigger: Borrar_SitiosParametrosFisiquicosQuimicos
CREATE TRIGGER Borrar_SitiosParametrosFisiquicosQuimicos
        BEFORE DELETE
            ON SITIOS_Sitio
BEGIN
    DELETE FROM SITIOS_ParametrosFisicoQuimicos
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SitiosTransponder
CREATE TRIGGER Borrar_SitiosTransponder
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SITIOS_Transponder
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_Submuestra
CREATE TRIGGER Borrar_Submuestra
        BEFORE DELETE
            ON TAXONOMIA_Arbolado
      FOR EACH ROW
BEGIN
    DELETE FROM ARBOLADO_Submuestra
          WHERE ArboladoID = OLD.ArboladoID;
END;


-- Trigger: Borrar_SueloCanalillo
CREATE TRIGGER Borrar_SueloCanalillo
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Canalillo
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloCarcava
CREATE TRIGGER Borrar_SueloCarcava
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Carcava
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloCoberturaSuelo
CREATE TRIGGER Borrar_SueloCoberturaSuelo
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_CoberturaSuelo
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloCostras
CREATE TRIGGER Borrar_SueloCostras
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Costras
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloDeformacionViento
CREATE TRIGGER Borrar_SueloDeformacionViento
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_DeformacionViento
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloDensidadAparente
CREATE TRIGGER Borrar_SueloDensidadAparente
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_DensidadAparente
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloErosionHidricaCanalillo
CREATE TRIGGER Borrar_SueloErosionHidricaCanalillo
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_ErosionHidricaCanalillo
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloErosionHidricaCarcava
CREATE TRIGGER Borrar_SueloErosionHidricaCarcava
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_ErosionHidricaCarcava
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloErosionLaminar
CREATE TRIGGER Borrar_SueloErosionLaminar
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_ErosionLaminar
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloHojarasca
CREATE TRIGGER Borrar_SueloHojarasca
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Hojarasca
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloLongitudCanalillo
CREATE TRIGGER Borrar_SueloLongitudCanalillo
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_LongitudCanalillo
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloLongitudCarcava
CREATE TRIGGER Borrar_SueloLongitudCarcava
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_LongitudCarcava
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloLongitudMonticulo
CREATE TRIGGER Borrar_SueloLongitudMonticulo
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_LongitudMonticulo
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloMedicionCanalillos
CREATE TRIGGER Borrar_SueloMedicionCanalillos
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_MedicionCanalillos
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloMedicionCarcavas
CREATE TRIGGER Borrar_SueloMedicionCarcavas
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_MedicionCarcavas
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloMedicionDunas
CREATE TRIGGER Borrar_SueloMedicionDunas
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_MedicionDunas
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloMuestras
CREATE TRIGGER Borrar_SueloMuestras
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Muestras
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloMuestrasPerfil
CREATE TRIGGER Borrar_SueloMuestrasPerfil
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_MuestrasPerfil
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloPavimentosErosion
CREATE TRIGGER Borrar_SueloPavimentosErosion
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_PavimentoErosion
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloPedestal
CREATE TRIGGER Borrar_SueloPedestal
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Pedestal
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloProfundidad
CREATE TRIGGER Borrar_SueloProfundidad
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Profundidad
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloSuelo
CREATE TRIGGER Borrar_SueloSuelo
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_Suelo
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_SueloVarillasErosion
CREATE TRIGGER Borrar_SueloVarillasErosion
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM SUELO_VarillaErosion
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TaxonomiaArbolado
CREATE TRIGGER Borrar_TaxonomiaArbolado
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_Arbolado
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TaxonomiaRepoblado
CREATE TRIGGER Borrar_TaxonomiaRepoblado
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_Repoblado
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TaxonomiaRepobladoVM
CREATE TRIGGER Borrar_TaxonomiaRepobladoVM
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_RepobladoVM
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TaxonomiaSotoBosque
CREATE TRIGGER Borrar_TaxonomiaSotoBosque
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_SotoBosque
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TaxonomiaVegetacionMayorGregarios
CREATE TRIGGER Borrar_TaxonomiaVegetacionMayorGregarios
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_VegetacionMayorGregarios
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TaxonomiaVegetacionMayorIndividual
CREATE TRIGGER Borrar_TaxonomiaVegetacionMayorIndividual
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_VegetacionMayorIndividual
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TaxonomiaVegetacionMenor
CREATE TRIGGER Borrar_TaxonomiaVegetacionMenor
        BEFORE DELETE
            ON SITIOS_Sitio
      FOR EACH ROW
BEGIN
    DELETE FROM TAXONOMIA_VegetacionMenor
          WHERE SitioID = OLD.SitioID;
END;


-- Trigger: Borrar_TrozaSubmuestra
CREATE TRIGGER Borrar_TrozaSubmuestra
        BEFORE DELETE
            ON ARBOLADO_Submuestra
      FOR EACH ROW
BEGIN
    DELETE FROM ARBOLADO_Troza
          WHERE SubmuestraID = OLD.SubmuestraID;
END;


-- Trigger: Borrar_UPM_Revision
CREATE TRIGGER Borrar_UPM_Revision
        BEFORE DELETE
            ON UPM_UPM
      FOR EACH ROW
BEGIN
    DELETE FROM SYS_UPM_Revision
          WHERE UPMID = OLD.UPMID;
END;*/


-- View: VW_AccesibilidadConglomerado
CREATE VIEW VW_AccesibilidadConglomerado AS
    SELECT up.UPMID,
           up.GradosLatitud,
           up.MinutosLatitud,
           up.SegundosLatitud,
           up.GradosLongitud,
           up.MinutosLongitud,
           up.SegundosLongitud,
           up.Datum,
           up.ErrorPresicion,
           up.Azimut,
           up.Distancia,
           ina.Descripcion AS TipoInaccesibilidad,
           up.OtroTipoInaccesibilidad,
           up.ExplicacionInaccesibilidad
      FROM UPM_UPM up
           LEFT JOIN
           CAT_TipoInaccesibilidad ina ON up.TipoInaccesibilidadID = ina.TipoInaccesibilidadID
     WHERE up.GradosLatitud IS NOT NULL;


-- View: VW_Arbolado_A
CREATE VIEW VW_Arbolado_A AS
    SELECT arb.ArboladoID,
           arb.SitioID,
           arb.Consecutivo,
           arb.NoIndividuo AS Individuo,
           arb.NoRama AS Rama,
           arb.Azimut,
           arb.Distancia,
           fe.Nombre AS Familia,
           gen.Nombre AS Genero,
           esp.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           arb.NombreComun,
           CASE arb.EsSubmuestra WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsSubmuestra,
           fv.Descripcion AS FormaVida,
           ff.Descripcion AS FormaFuste,
           con.Descripcion AS Condicion,
           mp.Clave AS TipoMuertoPie,
           gp.Clave AS GradoPutrefaccion,
           tt.Clave AS TipoTocon,
           arb.DiametroNormal,
           arb.AlturaTotal,
           arb.AnguloInclinacion,
           arb.AlturaFusteLimpio,
           arb.AlturaComercial,
           arb.DiametroCopaNS,
           arb.DiametroCopaEO,
           ad1.Agente1,
           ad1.Severidad1,
           ad2.Agente2,
           ad2.Severidad2,
           vig.VigorID AS Vigor,
           nv.Clave AS NivelVigor,
           arb.ClaveColecta
      FROM TAXONOMIA_Arbolado arb
           LEFT JOIN
           CAT_FamiliaEspecie fe ON arb.FamiliaID = fe.FamiliaID
           LEFT JOIN
           CAT_Genero gen ON arb.GeneroID = gen.GeneroID
           LEFT JOIN
           CAT_Especie esp ON arb.EspecieID = esp.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON arb.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_TipoFormaVidaArbolado fv ON arb.FormaVidaID = fv.FormaVidaID
           LEFT JOIN
           CAT_TipoFormaFuste ff ON arb.FormaFusteID = ff.FormaFusteID
           LEFT JOIN
           CAT_CondicionArbolado con ON arb.CondicionID = con.CondicionID
           LEFT JOIN
           CAT_CondicionMuertoPie mp ON arb.MuertoPieID = mp.MuertoPieID
           LEFT JOIN
           CAT_GradoPutrefaccionArbolado gp ON arb.GradoPutrefaccionID = gp.GradoPutrefaccionID
           LEFT JOIN
           CAT_TipoTocon tt ON arb.TipoToconID = tt.TipoToconID
           LEFT JOIN
           (
               SELECT ad.ArboladoID,
                      ca.Clave AS Agente1,
                      cp.Clave AS severidad1
                 FROM ARBOLADO_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 1
           )
           ad1 ON arb.ArboladoID = ad1.ArboladoID
           LEFT JOIN
           (
               SELECT ad.ArboladoID,
                      ca.Clave AS Agente2,
                      cp.Clave AS severidad2
                 FROM ARBOLADO_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 2
           )
           ad2 ON arb.ArboladoID = ad2.ArboladoID
           LEFT JOIN
           CAT_TipoVigorArbolado vig ON arb.VigorID = vig.VigorID
           LEFT JOIN
           CAT_NivelVigor nv ON arb.NivelVigorID = nv.NivelVigorID
     ORDER BY arb.Consecutivo ASC;


-- View: VW_Arbolado_D
CREATE VIEW VW_Arbolado_D AS
    SELECT arb.ArboladoID,
           arb.SitioID,
           arb.Consecutivo,
           arb.NoIndividuo AS Individuo,
           arb.NoRama AS Rama,
           arb.Azimut,
           arb.Distancia,
           fe.Nombre AS Familia,
           gen.Nombre AS Genero,
           esp.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           arb.NombreComun,
           CASE arb.EsColecta WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsColecta,
           CASE arb.EsSubmuestra WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsSubmuestra,
           fv.Descripcion AS FormaVida,
           ff.Descripcion AS FormaFuste,
           con.Descripcion AS Condicion,
           mp.Clave AS TipoMuertoPie,
           gp.Clave AS GradoPutrefaccion,
           tt.Clave AS TipoTocon,
           arb.DiametroNormal,
           arb.AlturaTotal,
           arb.AnguloInclinacion,
           arb.AlturaFusteLimpio,
           arb.AlturaComercial,
           arb.DiametroCopaNS,
           arb.DiametroCopaEO,
           pcv.Clave AS ProporcionCopaViva,
           elc.Codigo AS ExposicionLuzCopa,
           pc.PosicionCopa,
           dc.Clave AS DencidadCopa,
           mr.Clave AS MuerteRegresiva,
           tf.Clave AS TransparenciaFollaje,
           ad1.Agente1,
           ad1.Severidad1,
           ad2.Agente2,
           ad2.Severidad2,
           arb.ClaveColecta
      FROM TAXONOMIA_Arbolado arb
           LEFT JOIN
           CAT_FamiliaEspecie fe ON arb.FamiliaID = fe.FamiliaID
           LEFT JOIN
           CAT_Genero gen ON arb.GeneroID = gen.GeneroID
           LEFT JOIN
           CAT_Especie esp ON arb.EspecieID = esp.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON arb.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_TipoFormaVidaArbolado fv ON arb.FormaVidaID = fv.FormaVidaID
           LEFT JOIN
           CAT_TipoFormaFuste ff ON arb.FormaFusteID = ff.FormaFusteID
           LEFT JOIN
           CAT_CondicionArbolado con ON arb.CondicionID = con.CondicionID
           LEFT JOIN
           CAT_CondicionMuertoPie mp ON arb.MuertoPieID = mp.MuertoPieID
           LEFT JOIN
           CAT_GradoPutrefaccionArbolado gp ON arb.GradoPutrefaccionID = gp.GradoPutrefaccionID
           LEFT JOIN
           CAT_TipoTocon tt ON arb.TipoToconID = tt.TipoToconID
           LEFT JOIN
           CAT_PorcentajeArbolado pcv ON arb.ProporcionCopaVivaID = pcv.PorcentajeArboladoID
           LEFT JOIN
           CAT_ExposicionLuzCopa elc ON arb.ExposicionCopaID = elc.ExposicionLuzID
           LEFT JOIN
           CAT_PosicionCopa pc ON arb.PosicionCopaID = pc.PosicionCopaID
           LEFT JOIN
           CAT_PorcentajeArbolado dc ON arb.DensidadCopaID = dc.PorcentajeArboladoID
           LEFT JOIN
           CAT_PorcentajeArbolado mr ON arb.MuerteRegresivaID = mr.PorcentajeArboladoID
           LEFT JOIN
           CAT_PorcentajeArbolado tf ON arb.TransparenciaFollajeID = tf.PorcentajeArboladoID
           LEFT JOIN
           (
               SELECT ad.ArboladoID,
                      ca.Clave AS Agente1,
                      cp.Clave AS severidad1
                 FROM ARBOLADO_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 1
           )
           ad1 ON arb.ArboladoID = ad1.ArboladoID
           LEFT JOIN
           (
               SELECT ad.ArboladoID,
                      ca.Clave AS Agente2,
                      cp.Clave AS severidad2
                 FROM ARBOLADO_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 2
           )
           ad2 ON arb.ArboladoID = ad2.ArboladoID
     ORDER BY arb.Consecutivo ASC;


-- View: VW_Arbolado_G
CREATE VIEW VW_Arbolado_G AS
    SELECT arb.ArboladoID,
           arb.SitioID,
           arb.Consecutivo,
           arb.NoIndividuo AS Individuo,
           arb.NoRama AS Rama,
           arb.Azimut,
           arb.Distancia,
           fe.Nombre AS Familia,
           gen.Nombre AS Genero,
           esp.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           arb.NombreComun,
           CASE arb.EsColecta WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsColecta,
           CASE arb.EsSubmuestra WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsSubmuestra,
           fv.Descripcion AS FormaVida,
           ff.Descripcion AS FormaFuste,
           con.Descripcion AS Condicion,
           mp.Clave AS TipoMuertoPie,
           gp.Clave AS GradoPutrefaccion,
           tt.Clave AS TipoTocon,
           arb.DiametroNormal,
           arb.DiametroBasal,
           arb.AlturaTotal,
           arb.AnguloInclinacion,
           arb.AlturaFusteLimpio,
           arb.AlturaComercial,
           arb.DiametroCopaNS,
           arb.DiametroCopaEO,
           ad1.Agente1,
           ad1.Severidad1,
           ad2.Agente2,
           ad2.Severidad2,
           nv.Clave AS NivelVigor,
           vig.Descripcion AS Vigor,
           arb.ClaveColecta
      FROM TAXONOMIA_Arbolado arb
           LEFT JOIN
           CAT_FamiliaEspecie fe ON arb.FamiliaID = fe.FamiliaID
           LEFT JOIN
           CAT_Genero gen ON arb.GeneroID = gen.GeneroID
           LEFT JOIN
           CAT_Especie esp ON arb.EspecieID = esp.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON arb.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_TipoFormaVidaArbolado fv ON arb.FormaVidaID = fv.FormaVidaID
           LEFT JOIN
           CAT_TipoFormaFuste ff ON arb.FormaFusteID = ff.FormaFusteID
           LEFT JOIN
           CAT_CondicionArbolado con ON arb.CondicionID = con.CondicionID
           LEFT JOIN
           CAT_CondicionMuertoPie mp ON arb.MuertoPieID = mp.MuertoPieID
           LEFT JOIN
           CAT_GradoPutrefaccionArbolado gp ON arb.GradoPutrefaccionID = gp.GradoPutrefaccionID
           LEFT JOIN
           CAT_TipoTocon tt ON arb.TipoToconID = tt.TipoToconID
           LEFT JOIN
           (
               SELECT ad.ArboladoID,
                      ca.Clave AS Agente1,
                      cp.Clave AS severidad1
                 FROM ARBOLADO_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 1
           )
           ad1 ON arb.ArboladoID = ad1.ArboladoID
           LEFT JOIN
           (
               SELECT ad.ArboladoID,
                      ca.Clave AS Agente2,
                      cp.Clave AS severidad2
                 FROM ARBOLADO_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 2
           )
           ad2 ON arb.ArboladoID = ad2.ArboladoID
           LEFT JOIN
           CAT_NivelVigor nv ON arb.NivelVigorID = nv.NivelVigorID
           LEFT JOIN
           CAT_TipoVigorArbolado vig ON arb.VigorID = vig.VigorID
     ORDER BY arb.Consecutivo ASC;


-- View: VW_Brigada
CREATE VIEW VW_Brigada AS
    SELECT bri.UPMID,
           brs.BrigadistaID,
           brs.Nombre,
           brs.ApellidoPaterno,
           brs.ApellidoMaterno,
           bri.PuestoID
      FROM BRIGADA_Brigadistas brs
           LEFT JOIN
           UPM_Brigada bri ON brs.BrigadistaID = bri.BrigadistaID;


-- View: VW_CarbonoCubiertaVegetal
CREATE VIEW VW_CarbonoCubiertaVegetal AS
    SELECT cv.CubiertaVegetalID,
           cv.SitioID,
           cv.Transecto,
           cc.Componente,
           cv.Altura5,
           cv.Altura10
      FROM CARBONO_CubiertaVegetal cv
           LEFT JOIN
           CAT_CarbonoComponente cc ON cv.ComponenteID = cc.ComponenteID;


-- View: VW_ColectaBotanica
CREATE VIEW VW_ColectaBotanica AS
    SELECT cb.UPMID,
           CASE WHEN fa.Nombre IS NULL THEN 'Desconocido' ELSE fa.Nombre END Familia,
           CASE WHEN ge.Nombre IS NULL THEN 'Desconocido' ELSE ge.Nombre END Genero,
           CASE WHEN es.Nombre IS NULL THEN 'Desconocido' ELSE es.Nombre END Especie,
           CASE WHEN inf.Nombre IS NULL THEN 'Desconocido' ELSE es.Nombre END Infraespecie,
           CASE WHEN cb.NombreComun IS NULL THEN '' ELSE cb.NombreComun END NombreComun,
           cb.ClaveColecta,
           cb.Sitio,
           cst.Seccion,
           cb.Consecutivo,
           CASE cb.ContraFuertes WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END ContraFuertes,
           CASE cb.Exudado WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END Exudado,
           cb.IndicarExudado,
           CASE cb.Color WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END Color,
           cb.IndicarColor,
           CASE cb.CambioColor WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END CambioColor,
           CASE cb.AceitesVolatiles WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END AceitesVolatiles,
           CASE cb.ColorFlor WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END ColorFlor,
           cb.IndicarColorFlor,
           CASE cb.HojasTejidoVivo WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END HojasTejidoVivo,
           CASE cb.FotoFlor WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END FotoFlor,
           CASE cb.FotoFruto WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END FotoFruto,
           CASE cb.FotoHojasArriba WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END FotoHojasArriba,
           CASE cb.FotoHojasAbajo WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END FotoHojasAbajo,
           CASE cb.FotoArbolCompleto WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END FotoArbolCompleto,
           CASE cb.FotoCorteza WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END FotoCorteza,
           CASE cb.VirutaIncluida WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END VirutaIncluida,
           CASE cb.CortezaIncluida WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END CortezaIncluida,
           CASE cb.MaderaIncluida WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END MaderaIncluida,
           CASE WHEN cb.Observaciones IS NULL THEN '' ELSE cb.Observaciones END Observaciones
      FROM TAXONOMIA_ColectaBotanica cb
           LEFT JOIN
           CAT_FamiliaEspecie fa ON cb.FamiliaID = fa.FamiliaID
           LEFT JOIN
           CAT_Genero ge ON cb.GeneroID = ge.GeneroID
           LEFT JOIN
           CAT_Especie es ON cb.EspecieID = cb.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON cb.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_SeccionesTaxonomicas cst ON cb.SeccionID = cst.SeccionTaxonomicaID;


-- View: VW_Contacto
CREATE VIEW VW_Contacto AS
    SELECT UPMID,
           CASE TipoContacto WHEN TRUE THEN 'Presencial' WHEN FALSE THEN 'Remoto' END TipoContacto,
           Nombre,
           Direccion,
           CASE TipoTelefono WHEN TRUE THEN 'Teléfono fijo' WHEN FALSE THEN 'Teléfono móvil' END TipoTelefono,
           NumeroTelefono,
           CASE tieneCorreo WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END CorreoElectronico,
           DireccionCorreo,
           CASE TieneRadio WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END Radio,
           Canal,
           Frecuencia,
           Observaciones
      FROM UPM_Contacto;


-- View: VW_Epifitas
CREATE VIEW VW_Epifitas AS
    SELECT epi.EpifitaID,
           epi.UPMID,
           tie.Nombre AS Tipo,
           pet.Descripcion AS PresenciaTroncos,
           per.Descripcion AS PresenciaRamas
      FROM UPM_Epifita epi
           LEFT JOIN
           CAT_TipoEpifita tie ON epi.ClaseTipoID = tie.TipoEpifitaID
           LEFT JOIN
           CAT_PresenciaEpifita pet ON epi.PresenciaTroncosID = pet.PresenciaEpifitaID
           LEFT JOIN
           CAT_PresenciaEpifita per ON epi.PresenciaRamasID = per.PresenciaEpifitaID;


-- View: VW_EvidenciaErosion
CREATE VIEW VW_EvidenciaErosion AS
    SELECT ee.EvidenciaErosionID,
           ee.CoberturaSueloID,
           ee.Punto,
           ee.Dosel,
           lt.Descripcion AS Suelo
      FROM SUELO_EvidenciaErosion ee
           LEFT JOIN
           CAT_TipoLecturaTierra lt ON ee.LecturaTierraID = lt.LecturaTierraID;


-- View: VW_Hojarasca
CREATE VIEW VW_Hojarasca AS
    SELECT ho.HojarascaID,
           ho.SitioID,
           th.Clave AS tipoHojarasca,
           ho.Punto,
           ho.EspesorHO,
           ho.EspesorF,
           ho.PesoTotalHO,
           ho.PesoTotalF,
           ho.PesoMuestraHO,
           ho.PesoMuestraF,
           ho.Observaciones,
           ho.ClaveHO,
           ho.ClaveF
      FROM SUELO_Hojarasca ho
           LEFT JOIN
           CAT_TipoHojarasca th ON ho.TipoHojarascaID = th.TipoHojarascaID;


-- View: VW_Informacion_General_UPM
CREATE VIEW VW_Informacion_General_UPM AS
    SELECT up.UPMID,
           ma.PROYECTO,
           ti.TipoUPM AS TipoUPM,
           up.FechaInicio AS FechaInicio,
           up.FechaFin AS FechaFin,
           ma.Estado,
           ma.Municipio,
           up.Predio,
           up.Paraje,
           te.Descripcion AS TipoTenencia,
           CASE ma.A WHEN TRUE THEN 'A' WHEN FALSE THEN NULL END A,
           CASE ma.B WHEN TRUE THEN 'B' WHEN FALSE THEN NULL END B,
           CASE ma.C WHEN TRUE THEN 'C' WHEN FALSE THEN NULL END C,
           CASE ma.D WHEN TRUE THEN 'D' WHEN FALSE THEN NULL END D,
           CASE ma.E WHEN TRUE THEN 'E' WHEN FALSE THEN NULL END E,
           CASE ma.F WHEN TRUE THEN 'F' WHEN FALSE THEN NULL END F,
           CASE ma.G WHEN TRUE THEN 'G' WHEN FALSE THEN NULL END G,
           CASE ma.H WHEN TRUE THEN 'H' WHEN FALSE THEN NULL END H
      FROM UPM_UPM up
           LEFT JOIN
           UPM_MallaPuntos ma ON up.UPMID = ma.UPMID
           LEFT JOIN
           CAT_TipoUPM ti ON up.TipoUPMID = ti.TipoUPMID
           LEFT JOIN
           CAT_TipoTenencia te ON up.TipoTenenciaID = te.TipoTenenciaID;


-- View: VW_LongitudComponente
CREATE VIEW VW_LongitudComponente AS
    SELECT lc.LongitudComponenteID,
           lc.SitioID,
           lc.Consecutivo,
           lc.Transecto,
           tc.Componente,
           cf.Nombre AS Familia,
           cg.Nombre AS Genero,
           ce.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           lc.NombreComun,
           CASE lc.EsColecta WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsColecta,
           lc.Segmento1,
           lc.Segmento2,
           lc.Segmento3,
           lc.Segmento4,
           lc.Segmento5,
           lc.Segmento6,
           lc.Segmento7,
           lc.Segmento8,
           lc.Segmento9,
           lc.Segmento10,
           lc.Total,
           lc.ClaveColecta
      FROM CARBONO_LongitudComponente lc
           LEFT JOIN
           CAT_TipoComponente tc ON tc.ComponenteID = lc.ComponenteID
           LEFT JOIN
           CAT_FamiliaEspecie cf ON lc.FamiliaID = cf.FamiliaID
           LEFT JOIN
           CAT_Genero cg ON lc.GeneroID = cg.GeneroID
           LEFT JOIN
           CAT_Especie ce ON lc.EspecieID = ce.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON lc.InfraespecieID = inf.InfraespecieID;


-- View: VW_Muestras
CREATE VIEW VW_Muestras AS
    SELECT mu.MuestrasID,
           mu.SitioID,
           pr.Descripcion AS Profundidad,
           mu.PesoMuestra,
           mu.Muestras,
           mu.Lectura1,
           mu.Lectura2,
           mu.Lectura3,
           mu.Lectura4,
           mu.Promedio,
           mu.ClaveColecta
      FROM SUELO_Muestras mu
           LEFT JOIN
           CAT_ProfundidadMuestras pr ON mu.ProfundidadID = pr.ProfundidadMuestraID;


-- View: VW_Repoblado
CREATE VIEW VW_Repoblado AS
    SELECT re.RepobladoID,
           re.SitioID,
           re.Consecutivo,
           fa.Nombre AS Familia,
           ge.Nombre AS Genero,
           es.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           re.NombreComun,
           CASE re.EsColecta WHEN 1 THEN 'NO' WHEN 0 THEN 'SI' END EsColecta,
           re.Frecuencia025150 AS Frecuencia025,
           re.Edad025150 AS Edad025,
           re.Frecuencia151275 AS Frecuencia151,
           re.Edad151275 AS Edad151,
           re.Frecuencia275,
           re.Edad275,
           tv.Descripcion AS Vigor,
           ad.Clave AS Danio,
           re.PorcentajeDanio,
           re.ClaveColecta
      FROM TAXONOMIA_Repoblado re
           LEFT JOIN
           CAT_FamiliaEspecie fa ON re.FamiliaID = fa.FamiliaID
           LEFT JOIN
           CAT_Genero ge ON re.GeneroID = ge.GeneroID
           LEFT JOIN
           CAT_Especie es ON re.EspecieID = es.EspecieID
           LEFT JOIN
           CAT_TipoVigorSotobosqueRepoblado tv ON re.VigorID = tv.VigorID
           LEFT JOIN
           CAT_AgenteDanio ad ON re.DanioID = ad.AgenteDanioID
           LEFT JOIN
           CAT_Infraespecie inf ON re.InfraespecieID = inf.InfraespecieID;


-- View: VW_RepobladoVM
CREATE VIEW VW_RepobladoVM AS
    SELECT rep.RepobladoVMID,
           rep.SitioID,
           rep.Consecutivo,
           fv.Descripcion AS FormaVida,
           fe.Nombre AS Familia,
           ge.Nombre AS Genero,
           es.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           rep.NombreComun,
           CASE rep.EsColecta WHEN 1 THEN 'SI' WHEN 0 THEN 'NO' END EsColecta,
           rep.Frecuencia50,
           rep.PorcentajeCobertura50,
           rep.Frecuencia51200,
           rep.PorcentajeCobertura51200,
           rep.Frecuencia200,
           rep.PorcentajeCobertura200,
           ad1.Agente1,
           ad1.Severidad1,
           ad2.Agente2,
           ad2.Severidad2,
           vi.Descripcion AS Vigor,
           rep.ClaveColecta
      FROM TAXONOMIA_RepobladoVM rep
           LEFT JOIN
           CAT_TipoFormaVidaRepobladoVM fv ON rep.FormaVidaID = fv.FormaVidaRepobladoVMID
           LEFT JOIN
           CAT_FamiliaEspecie fe ON rep.FamiliaID = fe.FamiliaID
           LEFT JOIN
           CAT_Genero ge ON rep.GeneroID = ge.GeneroID
           LEFT JOIN
           CAT_Especie es ON rep.EspecieID = es.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON rep.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_TipoVigorSotobosqueRepoblado vi ON rep.VigorID = vi.VigorID
           LEFT JOIN
           (
               SELECT ad.RepobladoVMID,
                      ca.Clave AS Agente1,
                      cp.Clave AS severidad1
                 FROM REPOBLADO_AgenteDanio ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 1
           )
           ad1 ON rep.RepobladoVMID = ad1.RepobladoVMID
           LEFT JOIN
           (
               SELECT ad.RepobladoVMID,
                      ca.Clave AS Agente2,
                      cp.Clave AS severidad2
                 FROM REPOBLADO_AgenteDanio ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_PorcentajeArbolado cp ON ad.SeveridadID = cp.PorcentajeArboladoID
                WHERE ad.NumeroDanio = 2
           )
           ad2 ON rep.RepobladoVMID = ad2.RepobladoVMID;


-- View: VW_Secuencia
CREATE VIEW VW_Secuencia AS
    SELECT mal.SecuenciaID,
           fo.FormatoID,
           sec.UPMID AS UPM,
           sec.Sitio,
           fo.Formato,
           CASE sec.Estatus WHEN 1 THEN 'CAPTURADO' WHEN 0 THEN 'PENDIENTE' WHEN -1 THEN 'SIN DATOS' END Estatus
      FROM SYS_SecuenciaCaptura sec
           LEFT JOIN
           SYS_Formatos fo ON sec.FormatoID = fo.FormatoID
           LEFT JOIN
           UPM_MallaPuntos mal ON sec.UPMID = mal.UPMID;


-- View: VW_Sitio_Cobertura
CREATE VIEW VW_Sitio_Cobertura AS
    SELECT si.UPMID,
           si.Sitio,
           co.SitioID,
           co.Gramineas,
           co.Helechos,
           co.Musgos,
           co.Liquenes,
           co.Hierbas,
           co.Roca,
           co.SueloDesnudo,
           co.Hojarasca,
           co.Grava,
           co.Otros,
           CASE si.SotobosqueFuera WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END SotobosqueFuera,
           si.PorcentajeSotobosqueFuera
      FROM SITIOS_CoberturaSuelo co
           LEFT JOIN
           SITIOS_Sitio si ON co.SitioID = si.SitioID;


-- View: VW_SotoBosque
CREATE VIEW VW_SotoBosque AS
    SELECT sb.SotoBosqueID,
           sb.SitioID,
           sb.Consecutivo,
           CASE WHEN fe.Nombre IS NULL THEN '' ELSE fe.Nombre END Familia,
           CASE WHEN ge.Nombre IS NULL THEN '' ELSE ge.Nombre END Genero,
           CASE WHEN es.Nombre IS NULL THEN '' ELSE es.Nombre END Especie,
           inf.Nombre AS Infraespecie,
           sb.NombreComun,
           CASE sb.EsColecta WHEN FALSE THEN 'NO' ELSE 'SI' END EsColecta,
           sb.Frecuencia025150,
           sb.Cobertura025150,
           sb.Frecuencia151275,
           sb.Cobertura151275,
           sb.Frecuencia275,
           sb.Cobertura275,
           vi.Descripcion AS Vigor,
           da.Clave AS ClaveDanio,
           sb.PorcentajeDanio,
           sb.ClaveColecta
      FROM TAXONOMIA_SotoBosque sb
           LEFT JOIN
           CAT_FamiliaEspecie fe ON sb.FamiliaID = fe.FamiliaID
           LEFT JOIN
           CAT_Genero ge ON sb.GeneroID = ge.GeneroID
           LEFT JOIN
           CAT_Especie es ON sb.EspecieID = es.EspecieID
           LEFT JOIN
           CAT_TipoVigorSotobosqueRepoblado vi ON sb.VigorID = vi.VigorID
           LEFT JOIN
           CAT_AgenteDanio da ON sb.DanioID = da.AgenteDanioID
           LEFT JOIN
           CAT_Infraespecie inf ON sb.InfraespecieID = inf.InfraespecieID;


-- View: VW_Submuestra
CREATE VIEW VW_Submuestra AS
    SELECT asu.SubmuestraID,
           asu.SitioID,
           asu.ArboladoID,
           arb.Consecutivo,
           arb.NoIndividuo,
           arb.NoRama,
           fam.Nombre AS Familia,
           gen.Nombre AS Genero,
           esp.Nombre AS Especie,
           asu.DiametroBasal,
           asu.Edad,
           asu.NumeroAnillos25,
           asu.LongitudAnillos10,
           asu.GrozorCorteza
      FROM ARBOLADO_Submuestra asu
           LEFT JOIN
           TAXONOMIA_Arbolado arb ON arb.ArboladoID = asu.ArboladoID
           LEFT JOIN
           CAT_FamiliaEspecie fam ON arb.FamiliaID = fam.FamiliaID
           LEFT JOIN
           CAT_Genero gen ON arb.GeneroID = gen.GeneroID
           LEFT JOIN
           CAT_Especie esp ON arb.EspecieID = esp.EspecieID
     ORDER BY arb.Consecutivo ASC;


-- View: VW_SubmuestraTroza
CREATE VIEW VW_SubmuestraTroza AS
    SELECT at.TrozaID,
           at.SubmuestraID,
           at.NoTroza,
           tt.Descripcion AS TipoTroza
      FROM ARBOLADO_Troza at
           LEFT JOIN
           CAT_TipoTroza tt ON at.TipoTrozaID = tt.TipoTrozaID
     ORDER BY at.NoTroza;


-- View: VW_VegetacionMayorGregarios
CREATE VIEW VW_VegetacionMayorGregarios AS
    SELECT vm.VegetacionMayorID,
           vm.SitioID,
           vm.Consecutivo,
           vm.NoIndividuo,
           fv.Morfotipo AS FormaVida,
           con.Descripcion AS Condicion,
           fam.Nombre AS Familia,
           gen.Nombre AS Genero,
           esp.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           CASE vm.EsColecta WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsColecta,
           vm.NombreComun,
           fc.Descripcion AS FormaCrecimiento,
           dc.Descripcion AS DensidadColonia,
           vm.AlturaTotalMaxima,
           vm.AlturaTotalMedia,
           vm.AlturaTotalMinima,
           vm.DiametroCoberturaMayor,
           vm.DiametroCoberturaMenor,
           ad1.Agente1,
           ad1.Severidad1,
           ad2.Agente2,
           ad2.Severidad2,
           vi.Descripcion AS Vigor,
           vm.ClaveColecta
      FROM TAXONOMIA_VegetacionMayorGregarios vm
           LEFT JOIN
           CAT_TipoFormaVidaZA fv ON vm.FormaVidaID = fv.FormaVidaZAID
           LEFT JOIN
           CAT_CondicionVM con ON vm.CondicionID = con.CondicionVMID
           LEFT JOIN
           CAT_FamiliaEspecie fam ON vm.FamiliaID = fam.FamiliaID
           LEFT JOIN
           CAT_Genero gen ON vm.GeneroID = gen.GeneroID
           LEFT JOIN
           CAT_Especie esp ON vm.EspecieID = esp.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON vm.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_TipoFormaCrecimiento fc ON vm.FormaCrecimientoID = fc.FormaCrecimientoID
           LEFT JOIN
           CAT_DensidadColonia dc ON vm.DensidadColoniaID = dc.DensidadColoniaID
           LEFT JOIN
           CAT_TipoVigorSotobosqueRepoblado vi ON vm.VigorID = vi.VigorID
           LEFT JOIN
           (
               SELECT ad.VegetacionMayorID,
                      ca.Clave AS Agente1,
                      cp.Descripcion AS severidad1
                 FROM VEGETACIONMAYORG_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_SeveridadZA cp ON ad.SeveridadID = cp.SeveridadID
                WHERE ad.NumeroDanio = 1
           )
           ad1 ON vm.VegetacionMayorID = ad1.VegetacionMayorID
           LEFT JOIN
           (
               SELECT ad.VegetacionMayorID,
                      ca.Clave AS Agente2,
                      cp.Descripcion AS severidad2
                 FROM VEGETACIONMAYORG_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_SeveridadZA cp ON ad.SeveridadID = cp.SeveridadID
                WHERE ad.NumeroDanio = 2
           )
           ad2 ON vm.VegetacionMayorID = ad2.VegetacionMayorID;


-- View: VW_VegetacionMayorIndividual
CREATE VIEW VW_VegetacionMayorIndividual AS
    SELECT vm.VegetacionMayorID,
           vm.SitioID,
           vm.Consecutivo,
           vm.NoIndividuo,
           fv.Morfotipo AS FormaVida,
           con.Descripcion AS Condicion,
           fam.Nombre AS Familia,
           gen.Nombre AS Genero,
           esp.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           CASE vm.EsColecta WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsColecta,
           vm.NombreComun,
           fg.Descripcion AS FormaGeometrica,
           df.Descripcion AS DensidadFollaje,
           vm.DiametroBase,
           vm.AlturaTotal,
           vm.DiametroCoberturaMayor,
           vm.DiametroCoberturaMenor,
           ad1.Agente1,
           ad1.Severidad1,
           ad2.Agente2,
           ad2.Severidad2,
           vi.Descripcion AS Vigor,
           vm.ClaveColecta
      FROM TAXONOMIA_VegetacionMayorIndividual vm
           LEFT JOIN
           CAT_TipoFormaVidaZA fv ON vm.FormaVidaID = fv.FormaVidaZAID
           LEFT JOIN
           CAT_CondicionVM con ON vm.CondicionID = con.CondicionVMID
           LEFT JOIN
           CAT_FamiliaEspecie fam ON vm.FamiliaID = fam.FamiliaID
           LEFT JOIN
           CAT_Genero gen ON vm.GeneroID = gen.GeneroID
           LEFT JOIN
           CAT_Especie esp ON vm.EspecieID = esp.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON vm.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_TipoFormaGeometrica fg ON vm.FormaGeometricaID = fg.FormaGeometricaID
           LEFT JOIN
           CAT_DensidadFollaje df ON vm.DensidadFollajeID = df.DensidadFollajeID
           LEFT JOIN
           CAT_TipoVigorSotobosqueRepoblado vi ON vm.VigorID = vi.VigorID
           LEFT JOIN
           (
               SELECT ad.VegetacionMayorID,
                      ca.Clave AS Agente1,
                      cp.Descripcion AS severidad1
                 FROM VEGETACIONMAYORI_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_SeveridadZA cp ON ad.SeveridadID = cp.SeveridadID
                WHERE ad.NumeroDanio = 1
           )
           ad1 ON vm.VegetacionMayorID = ad1.VegetacionMayorID
           LEFT JOIN
           (
               SELECT ad.VegetacionMayorID,
                      ca.Clave AS Agente2,
                      cp.Descripcion AS severidad2
                 FROM VEGETACIONMAYORI_DanioSeveridad ad
                      LEFT JOIN
                      CAT_AgenteDanio ca ON ad.AgenteDanioID = ca.AgenteDanioID
                      LEFT JOIN
                      CAT_SeveridadZA cp ON ad.SeveridadID = cp.SeveridadID
                WHERE ad.NumeroDanio = 2
           )
           ad2 ON vm.VegetacionMayorID = ad2.VegetacionMayorID;


-- View: VW_VegetacionMenor
CREATE VIEW VW_VegetacionMenor AS
    SELECT vm.VegetacionMenorID,
           vm.SitioID,
           vm.Consecutivo,
           fam.Nombre AS Familia,
           gen.Nombre AS Genero,
           esp.Nombre AS Especie,
           inf.Nombre AS Infraespecie,
           vm.NombreComun,
           CASE EsColecta WHEN TRUE THEN 'SI' WHEN FALSE THEN 'NO' END EsColecta,
           fv.Descripcion AS FormaVida,
           con.Descripcion AS Condicion,
           vm.Numero0110,
           vm.Numero1125,
           vm.Numero2650,
           vm.Numero5175,
           vm.Numero76100,
           vm.Numero101125,
           vm.Numero126150,
           vm.Numero150,
           vm.PorcentajeCobertura,
           ad1.Agente1,
           ad1.Severidad1,
           ad2.Agente2,
           ad2.Severidad2,
           vi.Descripcion AS Vigor,
           vm.ClaveColecta
      FROM TAXONOMIA_VegetacionMenor vm
           LEFT JOIN
           CAT_FamiliaEspecie fam ON vm.FamiliaID = fam.FamiliaID
           LEFT JOIN
           CAT_Genero gen ON vm.GeneroID = gen.GeneroID
           LEFT JOIN
           CAT_Especie esp ON vm.EspecieID = esp.EspecieID
           LEFT JOIN
           CAT_Infraespecie inf ON vm.InfraespecieID = inf.InfraespecieID
           LEFT JOIN
           CAT_TipoFormaVidaRepobladoVM fv ON vm.FormaVidaID = fv.FormaVidaRepobladoVMID
           LEFT JOIN
           CAT_CondicionVM con ON vm.CondicionID = con.CondicionVMID
           LEFT JOIN
           CAT_TipoVigorSotobosqueRepoblado vi ON vm.VigorID = vi.VigorID-- -----------------------------------------------------------------------------------------------
           LEFT JOIN
           (
               SELECT agd.Clave AS Agente1,
                      vmen.VegetacionMenorID,
                      agd.AgenteDanioID AS Agente1ID,
                      sev.SeveridadID AS severidad1
                 FROM VEGETACIONMENOR_DanioSeveridad vmen
                      LEFT JOIN
                      CAT_SeveridadZA sev ON vmen.SeveridadID = sev.SeveridadID
                      LEFT JOIN
                      CAT_AgenteDanio agd ON agd.AgenteDanioID = vmen.AgenteDanioID
                WHERE vmen.NumeroDanio = 1
           )
           ad1 ON vm.VegetacionMenorID = ad1.VegetacionMenorID-- ----------------------------------------------------------------------------------------------
           LEFT JOIN
           (
               SELECT agd2.Clave AS Agente2,
                      vmen2.VegetacionMenorID,
                      agd2.AgenteDanioID AS Agente2ID,
                      sev2.SeveridadID AS severidad2
                 FROM VEGETACIONMENOR_DanioSeveridad vmen2
                      LEFT JOIN
                      CAT_SeveridadZA sev2 ON vmen2.SeveridadID = sev2.SeveridadID
                      LEFT JOIN
                      CAT_AgenteDanio agd2 ON agd2.AgenteDanioID = vmen2.AgenteDanioID
                WHERE vmen2.NumeroDanio = 2
           )
           ad2 ON vm.VegetacionMenorID = ad2.VegetacionMenorID;


-- View: VW_ViaAccesibilidad
CREATE VIEW VW_ViaAccesibilidad AS
    SELECT ac.AccesibilidadID,
           ac.UPMID,
           mt.Medio,
           va.Via,
           ac.Distancia,
           co.Condicion
      FROM PC_Accesibilidad ac
           LEFT JOIN
           CAT_MedioTransporte mt ON ac.MedioTransporteID = mt.MedioTransporteID
           LEFT JOIN
           CAT_ViaAccesibilidad va ON ac.ViaAccesibilidadID = va.ViaAccesibilidadID
           LEFT JOIN
           CAT_CondicionAccesibilidad co ON ac.CondicionAccesibilidadID = co.CondicionAccesibilidadID;

