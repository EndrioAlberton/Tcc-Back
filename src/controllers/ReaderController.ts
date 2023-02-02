import { createQueryBuilder, getRepository, ILike } from "typeorm"; 
import { Readers } from "../entity/Readers"; 
import { Request, Response } from "express";  
import { comparePasswords, hash } from "../common/bcrypt.helpers";  
import { validateLogin } from "./LoginReader";  
import { findByIdLibrary } from "./LibraryController";
import { Libraries } from "../entity/Libraries";
import { Books } from "../entity/Books";
 
const RELATIONS = { relations: ['libraries', 'loans']}; 
const NO_RELATIONS = {};   

export const getNotLibraryReaders = async (request: Request, response: Response) => {

    const readers = await getRepository(Readers).find()  
     
    return response.json(readers);  

}; 
 
export const getReader = async (request: Request, response: Response) => {
    const { readerId }  = request.params;  
    const reader = await findByIdReader(readerId);   
    if (!reader) return response.json({ message: 'ID não corresponde a nenhum leitor'});
    return response.json(reader);
};    
  
export const getReadersLibrary = async (request: Request, response: Response) => {  
    const libraryId = request.params.libraryId; 
    const libraryReaders = await findByIdLibrary(libraryId) 
           
    if(!libraryReaders) return response.status(404).json({ message: 'Nenhum dado foi encontrado' });  

    return response.json(libraryReaders.readers); 
  }
   
  export const findByIdReader = async (id: string, relations=true): Promise<Readers> => {
    const relation = relations ? RELATIONS : NO_RELATIONS;
    const reader = await getRepository(Readers).findOne({
        where: { id },
        ...relation,
    }); 
    return (reader);  
}        
 
export const findByNameReader = async (name: string, relations=true): Promise<Readers> => {
    const relation = relations ? RELATIONS : NO_RELATIONS;
    const reader = await getRepository(Readers).findOne({
        where: { nome: ILike(`%${name}%`)},
        ...relation,
    }); 
    return reader;  
}   
   
export const checkReaderInLibrary = async (request: Request, response: Response) => { 
    const {id} = request.params;  
    const reader = findByIdReader(id)  
     
}

export const getReaderSearch = async (request: Request, response: Response) => { 
    const name = request.query.name;  
    const readerSearch = await getRepository(Readers).find( 
        {where: [
            {nome: ILike(`%${name}%`),} 
            
        ]})      
         
    if(!readerSearch) return response.status(404).json({ message: 'Nenhum dado foi encontrado' });  
 
    return response.json(readerSearch);
  }  

  export const getReadersEmailSearch = async (request: Request, response: Response) => { 
    const email = request.query.email;  

    const readerSearch = await getRepository(Readers).find( 
        {where: [
            {email: email} 
            
        ]})     
                 
    if(!readerSearch) return response.status(404).json({ message: 'Nenhum dado foi encontrado' });  
    
    return response.json(readerSearch);
  }  
    
  export const getReaderLibrarySearch = async (request: Request, response: Response) => {  
    const libraryId = request.params.libraryId;   
    const nome = request.query.name;   
    const stringName = String(nome);

    const library = await findByIdLibrary(libraryId);   
 
    const readerLibrarySearch = library.readers.filter(readers => (readers.nome.toUpperCase().includes(stringName.toUpperCase())))
    return response.json(readerLibrarySearch);
  } 

export const saveReader = async (request: Request, response: Response) => {
    const reader = request.body;   

    reader.password = await hash(reader.password);   
          
    await getRepository(Readers).save(reader);

    return response.json(reader);  
};  
 
export const updateReader = async (request: Request, response: Response) => {
    
    const { id } = request.params; 

    const passwordBody = request.body.password
     
    request.body.password = await hash(request.body.password)

    const reader = await getRepository(Readers).findOne(id)

    const { password: hashedPassword } = reader;

    const isPasswordEquals = await comparePasswords(passwordBody, hashedPassword); 

    if (isPasswordEquals){ 
        const reader = await getRepository(Readers).update(id, request.body); 
 
        if (reader.affected === 1){ 
            const updatedreader = await getRepository(Readers).findOne(id); 
            return response.json(updatedreader);   
        } 
        
        return response.status(404).json({ message: 'Leitor não encontrado' });  
    }  if (!isPasswordEquals){ 
        return response.json({ message: 'Senha errada' });  
    }

};    
 
export const deleteReader = async (request: Request, response: Response) => { 
    const { id } = request.params; 
    const reader = await getRepository(Readers).delete(id); 
 
    if (reader.affected === 1){ 
        const readerUpdate = await getRepository(Readers).findOne(id)
        return response.json({ message: 'Leitor removido!' })
    } 
     
    return response.status(404).json({ message: 'Leitor não encontrado' }); 

};  
 
export const getReaderLogin = async (request: Request, response: Response) => {
    const {email, password} = request.body;
    const readerLogin = await validateLogin(email, password);    

    if (!readerLogin) {
        return response.json(readerLogin);
        
    }

    const reader = await getRepository(Readers).findOne(readerLogin.id);

    return response.json(reader);
    };     
     