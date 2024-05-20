USE cac_database_test;

-- insercion data categorias
insert into categorias
values(1,'categoria1','cat uno'),
(2,'categoria2','cat uno'),
(3,'categoria3','cat uno'),
(4,'categoria4','cat uno');

-- insercion data region
insert into region
values
(1,'guadalajara'),
(2,'monterrey'),
(3,'mexdf'),
(4,'baires'),
(5,'santa fe');


-- insercion data productos
insert into productos
values
(1, 'jcb', 9, 3, 978.73, 8, 6, 'qe'),
(2, 'maestro', 6, null, 824.3, 1, 14, 'nq'),
(3, 'diners-club-enroute', 3, 3, 481.08, 1, 16, 'aq'),
(4, 'diners-club-enroute', 5, 3, 324.79, 6, 17, 'gl'),
(5, 'americanexpress', null, 4, 843.41, 6, 2, 'ji'),
(6, 'jcb', 2, 3, 620.37, 1, 14, 'bf'),
(7, 'mastercard', 7, 1, 145.88, 2, 17, 'gj'),
(8, 'jcb', 9, null, 129.05, 1, 19, 'px'),
(9, 'jcb', 8, 4, 148.12, 5, 20, 'oa'),
(10, 'mastercard', 9, 2, 880.51, 7, 18, 'ql'),
(11, 'switch', 10, 4, 948.72, 4, 2, 'dj'),
(12, 'maestro', 10, 4, 703.24, 4, 5, 'of'),
(13, 'diners-club-carte-blanche', 2, 1, 751.22, 2, 4, 'ic'),
(14, 'jcb', 3, 4, 777.19, 3, 6, 'vp'),
(15, 'china-unionpay', 1, 4, 316.81, 9, 19, 'pp'),
(16, 'jcb', 3, 4, 595.97, 5, 20, 'kw'),
(17, 'diners-club-carte-blanche', 7, null, 330.68, 6, 11, 'dx'),
(18, 'diners-club-enroute', 3, null, 526.71, 3, 2, 'ht'),
(19, 'visa-electron', 2, 2, 889.34, 3, 16, 'ox'),
(20, 'laser', 1, 1, 495.85, 1, 15, 'yd');


insert into clientes_morosos
values
(1,'Blinnie', 1000),
(4, 'Leeann', 2000),
(6,'Bay', 400);

-- clientes
insert into clientes
values
(1, 'Skipstorm', 'Blinnie', 'METHYLPHENIDATE HYDROCHLORIDE', 'Pipelayer', 'Cercal', 5, '2490-105', 'Portugal'),
(2, 'Roomm', 'Ogden', 'NovoLog', 'HVAC', 'Silver Spring', 2, '20910', 'United States'),
(3, 'DabZ', 'Dewitt', 'Perphenazine', 'Painter', 'Bendo', 4, null, 'Indonesia'),
(4, 'Photospace', 'Leeann', 'Drainage-Tone', 'Waterproofer', 'Silver Spring', 3, null, 'Indonesia'),
(5, 'Yoveo', 'Marchelle', 'Bamboo Sap Patch', 'Boilermaker', 'Araulí', 2, null, 'Honduras'),
(6, 'Teklist', 'Bay', 'SOOTHE AND CURE', 'Boilermaker', 'El Paso', 1, '88530', 'United States'),
(7, 'Jabberbean', 'Antonio Moreno', 'Coniferyl Alcohol', 'Tile Setter', 'Moca', 3, '11902', 'Dominican Republic'),
(8, 'Dabjam', 'Maria Anders', 'Warfarin Sodium', 'Plasterers', 'Paradela', 1, '4785-231', 'Portugal'),
(9, 'Mudo', 'Torrey', 'Cyclobenzaprine Hydrochloride', 'Pipelayer', 'Roriz', 1, '4750-654', 'Portugal'),
(10, 'Thoughtsphere', 'Venus', 'levocetirizine dihydrochloride', 'Sheet Metal Worker', 'Yélimané', 1, null, 'Mali'),
(11, 'Mita', 'Hurlee', 'Up and Up Nicotine', 'Laborer', 'Valinhos', 3, '4580-389', 'Portugal'),
(12, 'Meevee', 'Clarisse', 'Premarin', 'Landscaper', 'Ibirité', 1, '32400-000', 'Brazil'),
(13, 'Oyoba', 'Cheslie', 'Levothyroxine Sodium', 'Landscaper', 'Zhichu', 5, null, 'China'),
(14, 'Edgeclub', 'Lindsey', 'Honey Bee hymenoptera venom Multidose', 'Electrician', 'Yatsushiro', 4, '286-0002', 'Japan'),
(15, 'Kwinu', 'Kile', 'allergy relief', 'Ironworker', 'Palatine', 2, '60078', 'United States'),
(16, 'Wikido', 'Keene', 'Nitrofurantoin Macrocrystals', 'Safety Officer', 'Hitachi', 2, '319-1417', 'Japan'),
(17, 'Edgewire', 'Kiah', 'Nata Komplete', 'Carpenter', 'Lagoaça', 4, '5180-205', 'Portugal'),
(18, 'Lazz', 'Roselle', 'Edarbyclor', 'Concrete Finisher', 'Tabālah', 2, null, 'Saudi Arabia'),
(19, 'Topiclounge', 'Jo ann', 'Couch Quack Grass', 'Linemen', 'Qijiawan', 1, null, 'China'),
(20, 'Skalith', 'Kerrin', 'Alprazolam', 'Boilermaker', 'Dallas', 5, '75210', 'United States');



-- pedidos
insert into pedidos
values
(1, 19, 10, '2021/09/15', '2021/10/30', '2021/04/13'),
(2, null, null, '2022/01/20', '2021/05/19', '2021/09/18'),
(3, 18, 2, '2021/09/17', '2021/08/25', '2021/11/07'),
(4, 13, 7, '2021/12/28', '2021/10/10', '2021/11/29'),
(5, 19, 1, '2022/02/26', '2022/03/21', '2021/04/18'),
(6, 4, 4, '2021/10/11', '2021/06/22', '2021/07/31'),
(7, null, null, '2022/02/08', '2021/11/16', '2021/05/26'),
(8, 13, 6, '2021/07/20', '2021/08/06', '2021/11/27'),
(9, 9, 4, '2021/06/03', '2022/02/13', '2021/05/29'),
(10, 20, 6, '2021/07/05', '2021/11/14', '2021/05/19'),
(11, 12, 10, '2021/04/19', '2022/04/08', '2021/07/21'),
(12, 17, 8, '2021/11/20', '2021/09/07', '2021/11/03'),
(13, 14, 4, '2021/04/18', '2022/03/16', '2021/04/21'),
(14, 4, 8, '2022/02/19', '2021/06/19', '2021/07/14'),
(15, 16, 1, '2021/08/23', '2021/08/02', '2021/05/22'),
(16, 10, 5, '2021/10/27', '2021/05/10', '2021/04/21'),
(17, 2, 8, '2021/06/25', '2021/06/20', '2021/04/26'),
(18, 12, 2, '2021/11/10', '2021/12/16', '2021/05/12'),
(19, 11, 10, '2022/03/04', '2022/01/05', '2021/12/08'),
(20, 2, 6, '2021/07/30', '2022/01/24', '2021/08/10');

-- empleados
insert into empleados
values
(1, 'Geroldi', 'Knox', '1980/07/13', 1, null),
(2, 'Dyball', 'Jens', '1993/07/31', 2, 'Robenia'),
(3, 'Reye', 'Garth', '1989/05/14', 3, null),
(4, 'Conry', 'Fredrick', '1989/06/17', 4, 'Rudolfo'),
(5, 'Jakubiak', 'Taddeo', '1980/10/18', 5, 'Fred'),
(6, 'Wingfield', 'Tuckie', '1988/07/11', 1, 'Lauritz'),
(7, 'Lively', 'Skip', '1987/06/08', 2, 'Page'),
(8, 'Curmi', 'Vachel', '1993/02/25', 3, null),
(9, 'Ortiga', 'Irwin', '1996/12/14', 4, 'Luci'),
(10, 'Smallridge', 'Tommie', '1985/04/22', 5, null);


-- pedido_detalle
insert into pedidos_detalle
values
(2, 2, 824.3, 60, 59),
(3, 20, 495.85, 79, 42),
(11, 12, 703.24, 35, 54),
(8, 5, 843.41, 45, 4),
(20, 12, 703.24, 87, 56),
(6, 14, 777.19, 3, 1),
(14, 2, 824.3, 67, 52),
(6, 5, 843.41, 61, 55),
(18, 2, 824.3, 48, 4),
(9, 12, 703.24, 1, 5);



explain proveedores;
-- proveedores
insert into proveedores
values
(1, 'Madlin', 'Pridden', null, null, 'CN'),
(2, 'Lorelle', 'McSkin', 3, '3515', 'AR'),
(3, 'Gaby', 'Fulle', null, '59320', 'PK'),
(4, 'Dorri', 'MacTeggart', 5, null, 'CN'),
(5, 'Gabriell', 'Delmonti', 3, null, 'ID'),
(6, 'Inge', 'Luckin', 2, '39236', 'US'),
(7, 'Donavon', 'Reisenstein', null, '5098', 'NO'),
(8, 'Greer', 'Baily', 2, '391710', 'RU'),
(9, 'Merci', 'Cordero', 1, null, 'KR'),
(10, 'Bartlet', 'Lamplugh', null, null, 'ID');






-- morosos
ALTER TABLE clientes_morosos
ADD CONSTRAINT fk_m_c FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id);

-- productos
ALTER TABLE productos
ADD CONSTRAINT fk_p_cat FOREIGN KEY (categoria_id) REFERENCES categorias (categoria_id);

ALTER TABLE productos
ADD CONSTRAINT fk_p_prov FOREIGN KEY (proveedor_id) REFERENCES proveedores (proveedor_id);

-- clientes
ALTER TABLE clientes
ADD CONSTRAINT fk_c_r FOREIGN KEY (cliente_region_alta) REFERENCES region (region_id);

-- proveedores
ALTER TABLE proveedores
ADD CONSTRAINT fk_p_r FOREIGN KEY (proveedor_region) REFERENCES region (region_id);

-- pedidos
ALTER TABLE pedidos
ADD CONSTRAINT fk_p_c FOREIGN KEY (cliente_id) REFERENCES clientes (cliente_id);

ALTER TABLE pedidos
ADD CONSTRAINT fk_p_e FOREIGN KEY (empleado_id) REFERENCES empleados (empleado_id);

-- pedidos_detalle
ALTER TABLE pedidos_detalle
ADD CONSTRAINT fk_p_deta FOREIGN KEY (pedido_id) REFERENCES pedidos (pedido_id);

ALTER TABLE pedidos_detalle
ADD CONSTRAINT fk_p_det_pr FOREIGN KEY (producto_id) REFERENCES productos (producto_id);

ALTER TABLE empleados
ADD CONSTRAINT fk_emp_reg FOREIGN KEY (empleado_region) REFERENCES region (region_id);

-- -- prestar atencion
ALTER TABLE pedidos_detalle
ADD CONSTRAINT value_pu FOREIGN KEY (precio_unitario) REFERENCES productos (precio_unitario) ON UPDATE CASCADE;

ALTER TABLE clientes_morosos
ADD CONSTRAINT valu_mora FOREIGN KEY (cliente_nombre) REFERENCES clientes (cliente_nombre);

