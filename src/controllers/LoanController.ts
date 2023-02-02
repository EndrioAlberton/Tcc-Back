import { getRepository } from "typeorm"; 
import { Loans } from "../entity/Loans";  
import { Request, Response } from "express";  
import { Books } from "../entity/Books"; 
import { Readers } from "../entity/Readers";
import { Libraries } from "../entity/Libraries";
import { findByIdBook } from "./BookController";
import { findByIdReader } from "./ReaderController";
 
const RELATIONS = { relations: ['library'] }; 
const NO_RELATIONS = {};     

export const findByIdLoan = async (id: string, relations=true): Promise<Loans> => {
    const relation = relations ? RELATIONS : NO_RELATIONS; 
    const loan = await getRepository(Loans).findOne({ 
        where: { id : id },
        ...relation,
    }); 
    return loan;  
}   
 
export const findLoanLibrary = async (id: string, relations=true): Promise<Loans> => {
    const relation = relations ? RELATIONS : NO_RELATIONS; 
    const loan = await getRepository(Loans).findOne({
        ...relation, 
        where: { library : id },
    }); 
    return loan;  
}   
  
export const getLoansLibrary = async (request: Request, response: Response) => { 
    const libraryId = request.params.libraryId;

    const loans = await findLoanLibrary(libraryId);   

    return response.json([loans]);   
};  

export const getLoans = async (request: Request, response: Response) => {
    const loans = await getRepository(Loans).find();    
     
    return response.json(loans);   
}; 
  
export const getLoan = async (request: Request, response: Response) => {
   const { id } = request.params; 
   const loan =  await getRepository(Loans).findOne(id); 
   
   return response.json(loan);
};   
  
export const saveLoan = async (request: Request, response: Response) => { 
    try {
        const loan: Loans = request.body;    
        const libraryId = request.params.libraryId;  
        const bookId = request.params.bookId;  
        const readerId = request.body.id;    
            
        const book = await getRepository(Books).findOne({where: { id: bookId } });    
        
        const checkBook = await findByIdBook(bookId)   
            
        const reader = await getRepository(Readers).findOne({where: { id: readerId }});     
                
        const library = await getRepository(Libraries).findOne({where: { id: libraryId }});    
        
        const checkReaderLoan = await findByIdReader(readerId)

        if(!reader) return  console.log("!reader")//response.json({ message: 'ID não corresponde a nenhum leitor'});  

        if (checkReaderLoan.loans !== null) return response.json('Leitor já tem um empréstimo');
        
        if (checkBook.library.id !== Number(libraryId)) return response.json('Livro não faz parte da bibliteca')  //response.status(404).json({ message: 'Livro não faz parte da bibliteca' }); 

        const libraries = await checkReaderLoan.libraries.filter(libraries => (library.id))

        const checkReaderLibrary = libraries.filter(library => (library.id === Number(libraryId)))

        if (checkReaderLibrary.length === 0) return response.json('Leitor não faz parte da bibliteca');

        loan.library = library;

        await getRepository(Loans).save(loan);  
        
        book.loan = loan;

        book.status = false;

        reader.loans = loan; 
        
        await getRepository(Readers).update(readerId, reader); 

        await getRepository(Books).update(bookId, book); 

        return response.json(loan);  
    } catch (error) {
        
    }

}; 
 
export const removeLoan = async (request: Request, response: Response) => { 
    const { id } = request.params; 

    const book = await findByIdBook(id)  
      
    const redearLoan = await getRepository(Readers)
    .createQueryBuilder("reader")
    .leftJoinAndSelect("reader.loans", "loans")
    .where('reader.loans = :id', { id: Number(book.loan.id)}) 
    .getOne()
     
    await getRepository(Loans).delete(book.loan.id);   
           
    redearLoan.loans = null;

    await getRepository(Readers).save(redearLoan);   
           
    book.loan = null;   

    book.status = true; 
         
    await getRepository(Books).save(book);      
    return;  
     
}  

export const updateLoan = async (request: Request, response: Response) => {
    const { id } = request.params; 
    const loan = await getRepository(Loans).update(id, request.body); 
 
    if (loan.affected === 1){ 
        const updatedLoan = await getRepository(Loans).findOne(id); 
        return response.json(updatedLoan);   
    } 
     
    return response.status(404).json({ message: 'Empréstimo não encontrado' });  
};    

 
export const deleteLoan = async (request: Request, response: Response) => { 
    const { id } = request.params; 
    const loan = await getRepository(Loans).delete(id); 
 
    if (loan.affected === 1){ 
        const loanUpdate = await getRepository(Loans).findOne(id)
        return response.json({ message: 'Empréstimo removido!' })
    } 
     
    return response.status(404).json({ message: 'Empréstimo não encontrado' });  
}  
 
