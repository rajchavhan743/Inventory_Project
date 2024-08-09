

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `bname` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `brand` (`id`, `categoryid`, `bname`, `status`) VALUES
(1, 2, 'DELL', 'active'),
(2, 2, 'ANCHOR', 'active'),
(3, 2, 'SYSKA', 'active'),
(4, 1, 'BOLT', 'active'),
(5, 1, 'REALME', 'active'),
(6, 1, 'ONEPLUS', 'active'),
(7, 3, 'BOAT', 'active'),
(8, 3, 'MIVI', 'active'),
(9, 3, 'JNL', 'active');

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `category` (`categoryid`, `name`, `status`) VALUES
(1, 'Smartphone', 'active'),
(2, 'Random Item', 'active'),
(3, 'Speaker', 'active');

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `mobile` int(50) NOT NULL,
  `balance` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `customer` (`id`, `name`, `address`, `mobile`, `balance`) VALUES
(1, 'SIDDHANT SANGOLE', '123,MOON', 2147483647, 35000.00),
(2, 'Shubham Pethe', 'KHARBI CHOWK NAGPUR,440024', 2147483647, 35000.00);


CREATE TABLE `ims_order` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `total_shipped` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `ims_order` (`order_id`, `product_id`, `total_shipped`, `customer_id`, `order_date`) VALUES
(1, '1', 5, 1, '2022-06-20 13:50:40'),
(2, '2', 3, 2, '2022-06-20 13:50:48');


CREATE TABLE `ims_product` (
  `pid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `model` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(150) NOT NULL,
  `base_price` double(10,2) NOT NULL,
  `tax` decimal(4,2) NOT NULL,
  `minimum_order` double(10,2) NOT NULL,
  `supplier` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `ims_product` (`pid`, `categoryid`, `brandid`, `pname`, `model`, `description`, `quantity`, `unit`, `base_price`, `tax`, `minimum_order`, `supplier`, `status`, `date`) VALUES
(1, 3, 9, 'JBL FLIP 6', 'BLUE', 'Louder , more powerful sound IP67 waterproof and dust proof 12 hours of play time ', 15, 'NOS', 11999.00, '18.00', 1.00, 2, 'active', '0000-00-00'),
(2, 3, 7, 'Stone 1200', 'Black', '14 W portable Wireless speaker with RGB LEDs, Up to 9hours of playtime, AUX ,USB and FM modes', 20, 'Box', 3999.00, '18.00', 1.00, 3, 'active', '0000-00-00'),
(3, 8, 16, 'BRAVIA', 'X75K', '4K ULTRA HD | High Dyanamic Range(HDR) |
Smart TV (Google Tv)', 5, 'Bags', 69900.00, '12.00', 1.00, 1, 'active', '0000-00-00');

CREATE TABLE `ims_purchase` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ims_purchase` (`purchase_id`, `supplier_id`, `product_id`, `quantity`, `purchase_date`) VALUES
(1, '1', '4', '25', '2022-06-20 13:50:07'),
(2, '2', '2', '35', '2022-06-20 13:50:14'),
(3, '3', '3', '10', '2022-06-20 13:50:29');


CREATE TABLE `ims_supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ims_supplier` (`supplier_id`, `supplier_name`, `mobile`, `address`, `status`) VALUES
(1, 'DTC', '09645987123', 'Nagpur', 'active'),
(2, 'FED-EX', '094568791252', 'Over There', 'active'),
(3, 'EKART', '09789897879', 'All over Maharashtra', 'active');

CREATE TABLE `ims_user` (
  `userid` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` enum('admin','member') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ims_user` (`userid`, `email`, `password`, `name`, `type`, `status`) VALUES
(1, 'Mitali@gmail.com', '83cfff69600191ec840225c611a06ab3', 'Administrator', 'admin', 'Active');

ALTER TABLE `ims_brand`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ims_category`
  ADD PRIMARY KEY (`categoryid`);

ALTER TABLE `ims_customer`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ims_order`
  ADD PRIMARY KEY (`order_id`);

ALTER TABLE `ims_product`
  ADD PRIMARY KEY (`pid`);

ALTER TABLE `ims_purchase`
  ADD PRIMARY KEY (`purchase_id`);

ALTER TABLE `ims_supplier`
  ADD PRIMARY KEY (`supplier_id`);

ALTER TABLE `ims_user`
  ADD PRIMARY KEY (`userid`);

ALTER TABLE `ims_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `ims_category`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `ims_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `ims_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `ims_product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `ims_purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `ims_supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `ims_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;
