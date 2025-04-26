#!/bin/bash
pg_dump -U odoo -d odoo17 | gzip > /data/backup/database/odoo17_$(date +%F-%H-%M%p).gz
