/****** Object:  Function [dbo].[GetCountriesFromCode]   Script Date: 2022/02/21 23:14:09 ******/
/****** ADGSTUDIOS 2022  ******/

CREATE FUNCTION [dbo].[GetCountriesFromCode]  (
    @Text varchar(max),
    @SplitterSymbol varchar(max)
)
RETURNS nvarchar(max)
AS
BEGIN
DECLARE @CountryCodes TABLE (
    [CountryID] int,
    [CountryName] varchar(max),
    [2DigCode] varchar(max),
    [3DigCode] varchar(max)
)
INSERT INTO
    @CountryCodes (
        [CountryID],
        [CountryName],
        [2DigCode],
        [3DigCode]
    )
VALUES
    (1, 'Afghanistan', 'AF', 'AFG'),
    (2, 'Albania', 'AL', 'ALB'),
    (3, 'Algeria', 'DZ', 'DZA'),
    (4, 'American Samoa', 'AS', 'ASM'),
    (5, 'Andorra', 'AD', 'AND'),
    (6, 'Angola', 'AO', 'AGO'),
    (7, 'Anguilla', 'AI', 'AIA'),
    (8, 'Antarctica', 'AQ', 'ATA'),
    (9, 'Antigua and Barbuda', 'AG', 'ATG'),
    (10, 'Argentina', 'AR', 'ARG'),
    (11, 'Armenia', 'AM', 'ARM'),
    (12, 'Aruba', 'AW', 'ABW'),
    (13, 'Australia', 'AU', 'AUS'),
    (14, 'Austria', 'AT', 'AUT'),
    (15, 'Azerbaijan', 'AZ', 'AZE'),
    (16, 'Bahamas ', 'BS', 'BHS'),
    (17, 'Bahrain', 'BH', 'BHR'),
    (18, 'Bangladesh', 'BD', 'BGD'),
    (19, 'Barbados', 'BB', 'BRB'),
    (20, 'Belarus', 'BY', 'BLR'),
    (21, 'Belgium', 'BE', 'BEL'),
    (22, 'Belize', 'BZ', 'BLZ'),
    (23, 'Benin', 'BJ', 'BEN'),
    (24, 'Bermuda', 'BM', 'BMU'),
    (25, 'Bhutan', 'BT', 'BTN'),
    (26, 'Bolivia ', 'BO', 'BOL'),
    (27, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES'),
    (28, 'Bosnia and Herzegovina', 'BA', 'BIH'),
    (29, 'Botswana', 'BW', 'BWA'),
    (30, 'Bouvet Island', 'BV', 'BVT'),
    (31, 'Brazil', 'BR', 'BRA'),
    (32, 'British Indian Ocean Territory ', 'IO', 'IOT'),
    (33, 'Brunei Darussalam', 'BN', 'BRN'),
    (34, 'Bulgaria', 'BG', 'BGR'),
    (35, 'Burkina Faso', 'BF', 'BFA'),
    (36, 'Burundi', 'BI', 'BDI'),
    (37, 'Cabo Verde', 'CV', 'CPV'),
    (38, 'Cambodia', 'KH', 'KHM'),
    (39, 'Cameroon', 'CM', 'CMR'),
    (40, 'Canada', 'CA', 'CAN'),
    (41, 'Cayman Islands ', 'KY', 'CYM'),
    (42, 'Central African Republic ', 'CF', 'CAF'),
    (43, 'Chad', 'TD', 'TCD'),
    (44, 'Chile', 'CL', 'CHL'),
    (45, 'China', 'CN', 'CHN'),
    (46, 'Christmas Island', 'CX', 'CXR'),
    (47, 'Cocos Islands', 'CC', 'CCK'),
    (48, 'Colombia', 'CO', 'COL'),
    (49, 'Comoros ', 'KM', 'COM'),
    (50, 'Democratic Republic of Congo', 'CD', 'COD'),
    (51, 'Congo ', 'CG', 'COG'),
    (52, 'Cook Islands ', 'CK', 'COK'),
    (53, 'Costa Rica', 'CR', 'CRI'),
    (54, 'Croatia', 'HR', 'HRV'),
    (55, 'Cuba', 'CU', 'CUB'),
    (205, 'Somalia', 'SO', 'SOM'),
    (206, 'South Africa', 'ZA', 'ZAF'),
    (
        207,
        'South Georgia and the South Sandwich Islands',
        'GS',
        'SGS'
    ),
    (208, 'South Sudan', 'SS', 'SSD'),
    (209, 'Spain', 'ES', 'ESP'),
    (210, 'Sri Lanka', 'LK', 'LKA'),
    (211, 'Sudan ', 'SD', 'SDN'),
    (212, 'Suriname', 'SR', 'SUR'),
    (213, 'Svalbard and Jan Mayen', 'SJ', 'SJM'),
    (214, 'Sweden', 'SE', 'SWE'),
    (215, 'Switzerland', 'CH', 'CHE'),
    (216, 'Syrian Arab Republic', 'SY', 'SYR'),
    (217, 'Taiwan', 'TW', 'TWN'),
    (218, 'Tajikistan', 'TJ', 'TJK'),
    (219, 'Tanzania', 'TZ', 'TZA'),
    (220, 'Thailand', 'TH', 'THA'),
    (221, 'Timor-Leste', 'TL', 'TLS'),
    (222, 'Togo', 'TG', 'TGO'),
    (223, 'Tokelau', 'TK', 'TKL'),
    (224, 'Tonga', 'TO', 'TON'),
    (225, 'Trinidad and Tobago', 'TT', 'TTO'),
    (226, 'Tunisia', 'TN', 'TUN'),
    (227, 'Turkey', 'TR', 'TUR'),
    (228, 'Turkmenistan', 'TM', 'TKM'),
    (229, 'Turks and Caicos Islands ', 'TC', 'TCA'),
    (230, 'Tuvalu', 'TV', 'TUV'),
    (231, 'Uganda', 'UG', 'UGA'),
    (232, 'Ukraine', 'UA', 'UKR'),
    (233, 'United Arab Emirates ', 'AE', 'ARE'),
    (234, 'Great Britan', 'GB', 'GBR'),
    (
        235,
        'United States Minor Outlying Islands ',
        'UM',
        'UMI'
    ),
    (236, 'United States of America ', 'US', 'USA'),
    (237, 'Uruguay', 'UY', 'URY'),
    (238, 'Uzbekistan', 'UZ', 'UZB'),
    (239, 'Vanuatu', 'VU', 'VUT'),
    (240, 'Venezuela', 'VE', 'VEN'),
    (241, 'Viet Nam', 'VN', 'VNM'),
    (242, 'Virgin Islands', 'VG', 'VGB'),
    (243, 'Virgin Islands', 'VI', 'VIR'),
    (244, 'Wallis and Futuna', 'WF', 'WLF'),
    (245, 'Western Sahara', 'EH', 'ESH'),
    (246, 'Yemen', 'YE', 'YEM'),
    (247, 'Zambia', 'ZM', 'ZMB'),
    (248, 'Zimbabwe', 'ZW', 'ZWE'),
    (249, 'Åland Islands', 'AX', 'ALA'),
    (56, 'Curaçao', 'CW', 'CUW'),
    (57, 'Cyprus', 'CY', 'CYP'),
    (58, 'Czechia', 'CZ', 'CZE'),
    (59, 'Côte d Ivoire', 'CI', 'CIV'),
    (60, 'Denmark', 'DK', 'DNK'),
    (61, 'Djibouti', 'DJ', 'DJI'),
    (62, 'Dominica', 'DM', 'DMA'),
    (63, 'Dominican Republic ', 'DO', 'DOM'),
    (64, 'Ecuador', 'EC', 'ECU'),
    (65, 'Egypt', 'EG', 'EGY'),
    (66, 'El Salvador', 'SV', 'SLV'),
    (67, 'Equatorial Guinea', 'GQ', 'GNQ'),
    (68, 'Eritrea', 'ER', 'ERI'),
    (69, 'Estonia', 'EE', 'EST'),
    (70, 'Eswatini', 'SZ', 'SWZ'),
    (71, 'Ethiopia', 'ET', 'ETH'),
    (72, 'Falkland Islands', 'FK', 'FLK'),
    (73, 'Faroe Islands ', 'FO', 'FRO'),
    (74, 'Fiji', 'FJ', 'FJI'),
    (75, 'Finland', 'FI', 'FIN'),
    (76, 'France', 'FR', 'FRA'),
    (77, 'French Guiana', 'GF', 'GUF'),
    (78, 'French Polynesia', 'PF', 'PYF'),
    (79, 'French Southern Territories ', 'TF', 'ATF'),
    (80, 'Gabon', 'GA', 'GAB'),
    (81, 'Gambia ', 'GM', 'GMB'),
    (82, 'Georgia', 'GE', 'GEO'),
    (83, 'Germany', 'DE', 'DEU'),
    (84, 'Ghana', 'GH', 'GHA'),
    (85, 'Gibraltar', 'GI', 'GIB'),
    (86, 'Greece', 'GR', 'GRC'),
    (87, 'Greenland', 'GL', 'GRL'),
    (88, 'Grenada', 'GD', 'GRD'),
    (89, 'Guadeloupe', 'GP', 'GLP'),
    (90, 'Guam', 'GU', 'GUM'),
    (91, 'Guatemala', 'GT', 'GTM'),
    (92, 'Guernsey', 'GG', 'GGY'),
    (93, 'Guinea', 'GN', 'GIN'),
    (94, 'Guinea-Bissau', 'GW', 'GNB'),
    (95, 'Guyana', 'GY', 'GUY'),
    (96, 'Haiti', 'HT', 'HTI'),
    (
        97,
        'Heard Island and McDonald Islands',
        'HM',
        'HMD'
    ),
    (98, 'Holy See ', 'VA', 'VAT'),
    (99, 'Honduras', 'HN', 'HND'),
    (100, 'Hong Kong', 'HK', 'HKG'),
    (101, 'Hungary', 'HU', 'HUN'),
    (102, 'Iceland', 'IS', 'ISL'),
    (103, 'India', 'IN', 'IND'),
    (104, 'Indonesia', 'ID', 'IDN'),
    (105, 'Iran', 'IR', 'IRN'),
    (106, 'Iraq', 'IQ', 'IRQ'),
    (107, 'Ireland', 'IE', 'IRL'),
    (108, 'Isle of Man', 'IM', 'IMN'),
    (109, 'Israel', 'IL', 'ISR'),
    (110, 'Italy', 'IT', 'ITA'),
    (111, 'Jamaica', 'JM', 'JAM'),
    (112, 'Japan', 'JP', 'JPN'),
    (113, 'Jersey', 'JE', 'JEY'),
    (114, 'Jordan', 'JO', 'JOR'),
    (115, 'Kazakhstan', 'KZ', 'KAZ'),
    (116, 'Kenya', 'KE', 'KEN'),
    (117, 'Kiribati', 'KI', 'KIR'),
    (118, 'Korea', 'KP', 'PRK'),
    (119, 'Korea', 'KR', 'KOR'),
    (120, 'Kuwait', 'KW', 'KWT'),
    (121, 'Kyrgyzstan', 'KG', 'KGZ'),
    (122, 'Lao', 'LA', 'LAO'),
    (123, 'Latvia', 'LV', 'LVA'),
    (124, 'Lebanon', 'LB', 'LBN'),
    (125, 'Lesotho', 'LS', 'LSO'),
    (126, 'Liberia', 'LR', 'LBR'),
    (127, 'Libya', 'LY', 'LBY'),
    (128, 'Liechtenstein', 'LI', 'LIE'),
    (129, 'Lithuania', 'LT', 'LTU'),
    (130, 'Luxembourg', 'LU', 'LUX'),
    (131, 'Macao', 'MO', 'MAC'),
    (132, 'Madagascar', 'MG', 'MDG'),
    (133, 'Malawi', 'MW', 'MWI'),
    (134, 'Malaysia', 'MY', 'MYS'),
    (135, 'Maldives', 'MV', 'MDV'),
    (136, 'Mali', 'ML', 'MLI'),
    (137, 'Malta', 'MT', 'MLT'),
    (138, 'Marshall Islands ', 'MH', 'MHL'),
    (139, 'Martinique', 'MQ', 'MTQ'),
    (140, 'Mauritania', 'MR', 'MRT'),
    (141, 'Mauritius', 'MU', 'MUS'),
    (142, 'Mayotte', 'YT', 'MYT'),
    (143, 'Mexico', 'MX', 'MEX'),
    (144, 'Micronesia', 'FM', 'FSM'),
    (145, 'Moldova', 'MD', 'MDA'),
    (146, 'Monaco', 'MC', 'MCO'),
    (147, 'Mongolia', 'MN', 'MNG'),
    (148, 'Montenegro', 'ME', 'MNE'),
    (149, 'Montserrat', 'MS', 'MSR'),
    (150, 'Morocco', 'MA', 'MAR'),
    (151, 'Mozambique', 'MZ', 'MOZ'),
    (152, 'Myanmar', 'MM', 'MMR'),
    (153, 'Namibia', 'NA', 'NAM'),
    (154, 'Nauru', 'NR', 'NRU'),
    (155, 'Nepal', 'NP', 'NPL'),
    (156, 'Netherlands ', 'NL', 'NLD'),
    (157, 'New Caledonia', 'NC', 'NCL'),
    (158, 'New Zealand', 'NZ', 'NZL'),
    (159, 'Nicaragua', 'NI', 'NIC'),
    (160, 'Niger ', 'NE', 'NER'),
    (161, 'Nigeria', 'NG', 'NGA'),
    (162, 'Niue', 'NU', 'NIU'),
    (163, 'Norfolk Island', 'NF', 'NFK'),
    (164, 'Northern Mariana Islands ', 'MP', 'MNP'),
    (165, 'Norway', 'NO', 'NOR'),
    (166, 'Oman', 'OM', 'OMN'),
    (167, 'Pakistan', 'PK', 'PAK'),
    (168, 'Palau', 'PW', 'PLW'),
    (169, 'Palestine', 'PS', 'PSE'),
    (170, 'Panama', 'PA', 'PAN'),
    (171, 'Papua New Guinea', 'PG', 'PNG'),
    (172, 'Paraguay', 'PY', 'PRY'),
    (173, 'Peru', 'PE', 'PER'),
    (174, 'Philippines ', 'PH', 'PHL'),
    (175, 'Pitcairn', 'PN', 'PCN'),
    (176, 'Poland', 'PL', 'POL'),
    (177, 'Portugal', 'PT', 'PRT'),
    (178, 'Puerto Rico', 'PR', 'PRI'),
    (179, 'Qatar', 'QA', 'QAT'),
    (180, 'Macedonia', 'MK', 'MKD'),
    (181, 'Romania', 'RO', 'ROU'),
    (182, 'Russian Federation ', 'RU', 'RUS'),
    (183, 'Rwanda', 'RW', 'RWA'),
    (184, 'Réunion', 'RE', 'REU'),
    (185, 'Saint Barthélemy', 'BL', 'BLM'),
    (
        186,
        'Saint Helena, Ascension and Tristan da Cunha',
        'SH',
        'SHN'
    ),
    (187, 'Saint Kitts and Nevis', 'KN', 'KNA'),
    (188, 'Saint Lucia', 'LC', 'LCA'),
    (189, 'Saint Martin', 'MF', 'MAF'),
    (190, 'Saint Pierre and Miquelon', 'PM', 'SPM'),
    (
        191,
        'Saint Vincent and the Grenadines',
        'VC',
        'VCT'
    ),
    (192, 'Samoa', 'WS', 'WSM'),
    (193, 'San Marino', 'SM', 'SMR'),
    (194, 'Sao Tome and Principe', 'ST', 'STP'),
    (195, 'Saudi Arabia', 'SA', 'SAU'),
    (196, 'Senegal', 'SN', 'SEN'),
    (197, 'Serbia', 'RS', 'SRB'),
    (198, 'Seychelles', 'SC', 'SYC'),
    (199, 'Sierra Leone', 'SL', 'SLE'),
    (200, 'Singapore', 'SG', 'SGP'),
    (201, 'Sint Maarten', 'SX', 'SXM'),
    (202, 'Slovakia', 'SK', 'SVK'),
    (203, 'Slovenia', 'SI', 'SVN'),
    (204, 'Solomon Islands', 'SB', 'SLB'),
    (
        205,
        'Great Britan and Nothern Ireand',
        'NULL',
        'NULL'
    ) 
	
DECLARE @SolvedCountries TABLE (CountryName nvarchar(max))

INSERT INTO
    @SolvedCountries
SELECT
    CountryName
FROM
    @CountryCodes
WHERE
    (
        [2DigCode] IN (
            SELECT
                UPPER(value) AS Codes
            FROM
                STRING_SPLIT(@Text, @SplitterSymbol)
        )
    ) 


DECLARE @Result nvarchar(max)
SET
    @Result = (
        SELECT
            STRING_AGG ([CountryName], ',') AS Result
        FROM
            @SolvedCountries
    );

Return @Result
END;

/* DEMO */
/* SELECT dbo.GetCountriesFromCode('za',';')
returns
South Africa

SELECT dbo.GetCountriesFromCode('za;af;al',';')

returns
Afghanistan,Albania,South Africa */