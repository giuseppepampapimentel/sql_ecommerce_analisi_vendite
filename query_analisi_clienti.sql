SELECT 
    C.nome_cliente,
    COUNT(O.id_ordine) AS numero_ordini,
    SUM(DO.quantita * DO.prezzo_unitario) AS totale_speso,
    AVG(DO.quantita * DO.prezzo_unitario) AS media_per_ordine
FROM cliente C
LEFT JOIN ordine O ON C.id_cliente = O.id_cliente
LEFT JOIN dettaglio_ordine DO ON O.id_ordine = DO.id_ordine
GROUP BY C.nome_cliente
ORDER BY totale_speso DESC;
