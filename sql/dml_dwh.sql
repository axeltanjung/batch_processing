DROP TABLE IF EXISTS dim_orders;
CREATE TABLE dim_orders (
	order_id INT NOT NULL,
	order_date DATE NOT NULL,
	user_id INT NOT NULL,
	payment_name VARCHAR(255),
	shipper_name VARCHAR(255),
	order_price INT,
	order_discount INT,
	voucher_name VARCHAR(255),
	voucher_price INT,
	order_total INT,
	rating_status VARCHAR(255)
	);

INSERT INTO dim_orders (
    order_id,
    order_date,
    user_id,
    payment_name,
    shipper_name,
    order_price,
    order_discount,
    voucher_name,
    voucher_price,
    order_total,
    rating_status
)
SELECT
    o.order_id,
    o.order_date,
    o.user_id,
    p.payment_name,
    s.shipper_name,
    o.order_price,
    o.order_discount,
    v.voucher_name,
    v.voucher_price,
    o.order_total,
    r.rating_status
FROM
    tb_orders o
JOIN tb_users u ON o.user_id = u.user_id
JOIN tb_payments p ON o.payment_id = p.payment_id
JOIN tb_shippers s ON o.shipper_id = s.shipper_id
LEFT JOIN tb_vouchers v ON o.voucher_id = v.voucher_id
LEFT JOIN tb_ratings r ON o.rating_id = r.rating_id;
