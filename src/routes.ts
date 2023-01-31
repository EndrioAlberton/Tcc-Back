import { Router, Request, Response } from 'express';   
 
import { getBooks, saveBook, getBook, updateBook, statusBook, deleteBook, getBooksLibrary, getBooksLibrarySearch, getEditBook } from './controllers/BookController';
import { getLibraries, getLibrary, saveLibrary, updateLibrary, deleteLibrary, getLibraryLogin, addLibraryReader, removeLibraryReader, getLibrariesSearch, getLibrariesEmailSearch} from './controllers/LibraryController';
import { deleteLoan, getLoan, getLoans, getLoansLibrary, removeLoan, saveLoan, updateLoan } from './controllers/LoanController';
import { deleteReader, getReader, getNotLibraryReaders, saveReader, updateReader, getReaderLogin, getReaderSearch, getReadersLibrary, getReaderLibrarySearch, checkReaderInLibrary, getReadersEmailSearch } from './controllers/ReaderController';
const routes: Router = Router(); 
 
routes.get('/books', getBooks); 
routes.get('/library/:libraryId/book/:bookId', getBook);  
routes.get('/book/:id', getEditBook); 
routes.post('/books', saveBook);  
routes.put('/book/:id', updateBook);
routes.patch('/books/:id', statusBook);   
routes.delete('/books/:id', deleteBook) 
   
routes.post('/library/:libraryId/saveBook', saveBook); 
routes.get('/library/:libraryId/books', getBooksLibrary);   
routes.get('/library/:libraryId/books/search/', getBooksLibrarySearch);   

routes.post('/library/:libraryId/addReader/:id', addLibraryReader) 
routes.delete('/library/:libraryId/addReader/:id', removeLibraryReader)
routes.get('/library/:libraryId/readers', getReadersLibrary);     
routes.get('/notLibrary/:libraryId/readers/search/', getReaderSearch);   
routes.get('/library/:libraryId/readers/search/', getReaderLibrarySearch);    
routes.get('/library/:libraryId/reader/:id/', checkReaderInLibrary);   

routes.get('/library/:libraryId/loans', getLoansLibrary);  
routes.get('/library/loans', getLoans); 

routes.get('/libraries/email/search/', getLibrariesEmailSearch); 
routes.get('/libraries/search/', getLibrariesSearch); 
routes.get('/libraries', getLibraries); 
routes.get('/libraries/:id', getLibrary);  
routes.post('/libraries/', saveLibrary); 
routes.put('/libraries/:id', updateLibrary);
routes.delete('/libraries/:id', deleteLibrary) 
routes.post('/LibraryLogin', getLibraryLogin); 

routes.get('/readers/email/search/', getReadersEmailSearch);  
routes.get('/notLibrary/:libraryId/readers', getNotLibraryReaders);   
routes.get('/readers/:readerId', getReader);  
routes.post('/readers/', saveReader); 
routes.put('/readers/:id', updateReader);
routes.delete('/readers/:id', deleteReader)  
routes.post('/ReaderLogin', getReaderLogin);    
 
routes.get('/loans', getLoans);  
routes.get('/loans/:id', getLoan);  
routes.post('/library/:libraryId/loan/book/:bookId', saveLoan); 
routes.put('/loans/:id', updateLoan);
routes.delete('/loans/:id', deleteLoan)   
routes.delete('/book/:id/removeLoan', removeLoan)  

export default routes;
