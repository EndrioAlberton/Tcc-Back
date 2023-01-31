import { join } from 'path';
import {Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, JoinColumn, OneToOne, ManyToOne, JoinTable, OneToMany} from 'typeorm'; 
import { Books } from './Books';
import { Libraries } from './Libraries';
import { Readers } from './Readers';
 
@Entity() 
export class Loans { 
     
    @PrimaryGeneratedColumn() 
    id: number;   
     
    @OneToMany(
        () => Readers,
        reader => reader.loans,
    )

    reader: Readers[];  
     
    @ManyToOne(
        () => Libraries,
        library => library.loan,
        {onDelete: 'CASCADE'}
    )
    library: Libraries   
    
     
    @CreateDateColumn()
    created_at: Date;
     
 }