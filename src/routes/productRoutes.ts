import { Router } from 'express';
import { createRecord, getRecord, getRecords, getRecordsFromCategory, getRecordsByUser } from '../controllers/productController';
import { Authorize } from '../middleware/authMiddleware';
import { updateRecord } from '../controllers/productController';
import { deleteRecord } from '../controllers/productController';

const routes = Router();
routes.get('/', getRecords);
routes.get('/:slug', getRecord);
routes.get('/category/:slug', getRecordsFromCategory);
// Route til at hente alle produkter for en specifik bruger (kræver autorisation)
routes.get('/user/:userId', Authorize, getRecordsByUser);
// Route til at oprette et nyt produkt (kræver autorisation)
routes.post('/', Authorize, createRecord);
routes.put('/:id', Authorize, updateRecord);
routes.delete('/:id', Authorize, deleteRecord);

export const productRoutes = routes;
