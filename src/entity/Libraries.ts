import {Entity, PrimaryGeneratedColumn, Column, OneToMany, ManyToMany, JoinTable} from 'typeorm'; 
import { Books } from './Books';
import { Loans } from './Loans';
import { Readers } from './Readers'; 
 
@Entity() 
export class Libraries { 
     
    @PrimaryGeneratedColumn() 
    id: number; 
     
    @OneToMany(
        () => Books,
        books => books.library,
        {onDelete: "CASCADE"}
    )
    books: Books[];    
     
    @ManyToMany(
        () => Readers,
        reader => reader.libraries,
        { onDelete: "CASCADE"}
      )
      @JoinTable({name:"library-joined-reader"})
      readers: Readers[];   
       
    @OneToMany(
        () => Loans,
        loan => loan.library,
        {onDelete: "CASCADE"}
    )
    loan: Loans[]; 

    @Column({length: 50}) 
    email: string;  
     
    @Column() 
    password: string;  
     
    @Column({length: 50}) 
    nome: string;   
     
    @Column({length: 8}) 
    cep: string; 

    @Column({length: 50}) 
    state: string;   
     
    @Column({length: 50}) 
    city: string;  
      
    @Column({length: 50}) 
    district: string;    
     
    @Column({length: 50}) 
    street: string;  
     
    @Column({length: 6}) 
    number: string;  
      
    @Column({length: 11}) 
    telephone: string;   
 }