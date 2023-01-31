import { getRepository, ILike, SimpleConsoleLogger } from "typeorm"; 
import { Libraries } from "../entity/Libraries"; 
import { Request, Response } from "express";  
import { comparePasswords, hash } from "../common/bcrypt.helpers"; 
import { validateLogin } from "./LoginLibrary";  
import { findByIdReader } from "./ReaderController";
import { Loans } from "../entity/Loans";
import { findByIdLoan } from "./LoanController";
 
  
const RELATIONS = { relations: ['readers', 'loan'] }; 
const NO_RELATIONS = {};  
  

export const getLibraries = async (request: Request, response: Response) => {
    const libraries = await getRepository(Libraries).find();  
    return response.json(libraries);   
}; 
 
export const getLibrary = async (request: Request, response: Response) => {
    const { id } = request.params;  
    const library = await getRepository(Libraries).findOne(id);   

    return response.json(library);
};  
 
export const saveLibrary = async (request: Request, response: Response) => {
    const library = request.body;   
    library.password = await hash(library.password);  
     
    await getRepository(Libraries).save(library);

    return response.json(library);  
};  

export const getLibrariesEmailSearch = async (request: Request, response: Response) => { 
    const email = request.query.email;  
     
    const librarySearch = await getRepository(Libraries).find( 
        {where: [
            {email: email} 
            
        ]})     
                 
    if(!librarySearch) return response.status(404).json({ message: 'Nenhum dado foi encontrado' });  
    
    return response.json(librarySearch);
  }  

export const getLibrariesSearch = async (request: Request, response: Response) => { 
    const name = request.query.name;  
 
    const librarySearch = await getRepository(Libraries).find( 
        {where: [
            {nome: ILike(`%${name}%`),} 
            
        ]})     
        
    console.log(librarySearch)
         
    if(!librarySearch) return response.status(404).json({ message: 'Nenhum dado foi encontrado' });  

    return response.json(librarySearch);
  }  
    
 
export const findByIdLibrary = async (id: string, relations=true): Promise<Libraries> => {
    const relation = relations ? RELATIONS : NO_RELATIONS;
    const library = await getRepository(Libraries).findOne({
        where:{ id },
        ...relation,
    }); 
    return library;  
}  
  
export const addLibraryReader = async (request: Request, response: Response) => { 
    
    const id = request.params.id;  
    const libraryId = request.params.libraryId;  
 
    const library = await findByIdLibrary(libraryId);  
    const newReaderLibrary = await findByIdReader(id);     

    library.readers.push(newReaderLibrary);
 
    await getRepository(Libraries).save(library); 
         
    return response.status(201).json({ message: 'Leitor vinculado a biblioteca corretamente' });  
};  
 
export const removeLibraryReader = async (request: Request, response: Response) => {     
     
    const id = request.params.id;  
    const libraryId = request.params.libraryId;    
     
    const checkReaderLoan = await findByIdReader(id)     
     
     
    const library = await findByIdLibrary(libraryId);  
    const removeReaderLibrary = await findByIdReader(id);       
          
    if (checkReaderLoan.loans === null){ 
             
        library.readers = library.readers.filter((readers) => { 
            return readers.id !== removeReaderLibrary.id; 
        })
        
        await getRepository(Libraries).save(library);      
        return;  

    }  if (checkReaderLoan.loans !== null){

        const loanId = String(checkReaderLoan.loans.id);
     
        const loan = await findByIdLoan(loanId)
                 
        if(loan.library.id === Number(libraryId)){  
            return response.json({ message: 'Leitor tem empréstimo pendente' });   
            
        } if (loan.library.id !== Number(libraryId)) {  
            
            library.readers = library.readers.filter((readers) => { 
                return readers.id !== removeReaderLibrary.id; 
            })
            
            await getRepository(Libraries).save(library);      
            return;  
        }
    }
}; 

export const updateLibrary = async (request: Request, response: Response) => {
    const { id } = request.params; 

    const passwordBody = request.body.password

    request.body.password = await hash(request.body.password)

    const library = await getRepository(Libraries).findOne(id)

    const { password: hashedPassword } = library;


    const isPasswordEquals = await comparePasswords(passwordBody, hashedPassword); 
    if (isPasswordEquals){ 
        const libraryNewValues = await getRepository(Libraries).update(id, request.body); 
    
        if (libraryNewValues.affected === 1){ 
            const updatedlibrary = await getRepository(Libraries).findOne(id); 
            return response.json(updatedlibrary);   
        } 
     
        return response.json({ message: 'Biblioteca não encontrado' });  
    }  if (!isPasswordEquals){ 
        console.log("Senha errada")
    }
};    
 
export const deleteLibrary = async (request: Request, response: Response) => { 
    const { id } = request.params; 
    const library = await getRepository(Libraries).delete(id); 
 
    if (library.affected === 1){ 
        const libraryUpdate = await getRepository(Libraries).findOne(id)
        return response.json({ message: 'Biblioteca removido!' })
    } 
     
    return response.status(404).json({ message: 'Biblioteca não encontrado' }); 

};  
 
export const getLibraryLogin = async (request: Request, response: Response) => {
    const {email, password} = request.body;
    const libraryLogin = await validateLogin(email, password);    
    if (!libraryLogin) 
        {
            return response.json(libraryLogin);
        }
        
    const library = await getRepository(Libraries).findOne(libraryLogin.id);

    return response.json(library);
    };    
